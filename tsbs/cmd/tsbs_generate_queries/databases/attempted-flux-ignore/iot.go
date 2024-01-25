package influx

import (
	"fmt"
	"strings"
	"time"

	"github.com/timescale/tsbs/cmd/tsbs_generate_queries/databases"
	"github.com/timescale/tsbs/cmd/tsbs_generate_queries/uses/iot"
	"github.com/timescale/tsbs/pkg/query"
)

// IoT produces Influx-specific queries for all the iot query types.
type IoT struct {
	*iot.Core
	*BaseGenerator
}

// NewIoT makes an IoT object ready to generate Queries.
func NewIoT(start, end time.Time, scale int, g *BaseGenerator) *IoT {
	c, err := iot.NewCore(start, end, scale)
	databases.PanicIfErr(err)
	return &IoT{
		Core:          c,
		BaseGenerator: g,
	}
}

func formatTimestamps(startTime, endTime time.Time) (string, string) {
	startTimeStr := startTime.UTC().Format("2006-01-02T15:04:05Z")
	endTimeStr := endTime.UTC().Format("2006-01-02T15:04:05Z")
	return startTimeStr, endTimeStr
}


func (i *IoT) getTrucksWhereWithNames(names []string) string {
	nameClauses := []string{}
	for _, s := range names {
		nameClauses = append(nameClauses, fmt.Sprintf("\"name\" = '%s'", s))
	}

	combinedHostnameClause := strings.Join(nameClauses, " or ")
	return "(" + combinedHostnameClause + ")"
}

func (i *IoT) getTruckWhereString(nTrucks int) string {
	names, err := i.GetRandomTrucks(nTrucks)
	if err != nil {
		panic(err.Error())
	}
	return i.getTrucksWhereWithNames(names)
}

// LastLocByTruck finds the truck location for nTrucks.
func (i *IoT) LastLocByTruck(qi query.Query, nTrucks int) {
	fluxQuery := fmt.Sprintf(`
        data
        |> range(start: %s, stop: %s)
        |> filter(fn: (r) => %s)
        |> last()
        |> project(fn: (r) => ({
            name: r._value.name,
            driver: r._value.driver,
            latitude: r._value.latitude,
            longitude: r._value.longitude
        }))
    `,
		i.Interval.Start(),
		i.Interval.End(),
		i.getTruckWhereString(nTrucks),
	)

	humanLabel := "Flux last location by specific truck"
	humanDesc := fmt.Sprintf("%s: random %4d trucks", humanLabel, nTrucks)

	i.fillInQuery(qi, humanLabel, humanDesc, fluxQuery)
}

// LastLocPerTruck finds all the truck locations along with truck and driver names.
func (i *IoT) LastLocPerTruck(qi query.Query) {
	fluxQuery := fmt.Sprintf(`
        data
        |> range(start: %s, stop: %s)
        |> filter(fn: (r) => r._measurement == "readings")
        |> group(columns: ["name", "driver"])
        |> last()
    `,
		i.Interval.Start(),
		i.Interval.End(),
	)

	humanLabel := "Flux last location per truck"
	humanDesc := humanLabel

	i.fillInQuery(qi, humanLabel, humanDesc, fluxQuery)
}

// TrucksWithLowFuel finds all trucks with low fuel (less than 10%).
func (i *IoT) TrucksWithLowFuel(qi query.Query) {
	fluxQuery := fmt.Sprintf(`
        data
        |> range(start: %s, stop: %s)
        |> filter(fn: (r) => r._measurement == "diagnostics" and r._field == "fuel_state" and r.fleet == "%s")
        |> group(columns: ["name"])
        |> last()
    `,
		i.Interval.Start(),
		i.Interval.End(),
		i.GetRandomFleet(),
	)

	humanLabel := "Flux trucks with low fuel"
	humanDesc := fmt.Sprintf("%s: under 10 percent", humanLabel)

	i.fillInQuery(qi, humanLabel, humanDesc, fluxQuery)
}

// TrucksWithHighLoad finds all trucks that have load over 90%.
func (i *IoT) TrucksWithHighLoad(qi query.Query) {
	fluxQuery := fmt.Sprintf(`
        data
        |> range(start: %s, stop: %s)
        |> filter(fn: (r) => r._measurement == "diagnostics" and r.fleet == "%s")
        |> group(columns: ["name", "driver"])
        |> last()
        |> filter(fn: (r) => r.current_load >= 0.9 * r.load_capacity)
    `,
		i.Interval.Start(),
		i.Interval.End(),
		i.GetRandomFleet(),
	)

	humanLabel := "Flux trucks with high load"
	humanDesc := fmt.Sprintf("%s: over 90 percent", humanLabel)

	i.fillInQuery(qi, humanLabel, humanDesc, fluxQuery)
}

// StationaryTrucks finds all trucks that have low average velocity in a time window.
func (i *IoT) StationaryTrucks(qi query.Query) {
	fluxQuery := fmt.Sprintf(`
        data
        |> range(start: %s, stop: %s)
        |> filter(fn: (r) => r._measurement == "readings" and r.fleet == "%s")
        |> group(columns: ["name", "driver"])
        |> mean(column: "velocity")
        |> filter(fn: (r) => r._value < 1)
    `,
		i.Interval.Start(),
		i.Interval.End(),
		i.GetRandomFleet(),
	)

	humanLabel := "Flux stationary trucks"
	humanDesc := fmt.Sprintf("%s: with low avg velocity in last 10 minutes", humanLabel)

	i.fillInQuery(qi, humanLabel, humanDesc, fluxQuery)
}

// TrucksWithLongDrivingSessions finds all trucks that have not stopped at least 20 mins in the last 4 hours.
func (i *IoT) TrucksWithLongDrivingSessions(qi query.Query) {
	fluxQuery := fmt.Sprintf(`
        data
        |> range(start: %s, stop: %s)
        |> filter(fn: (r) => r._measurement == "readings" and r.fleet == "%s")
        |> mean(column: "velocity")
        |> filter(fn: (r) => r._value > 0)
        |> group(columns: ["name", "driver"])
        |> count()
        |> filter(fn: (r) => r._value > %d)
    `,
		i.Interval.Start(),
		i.Interval.End(),
		i.GetRandomFleet(),
		tenMinutePeriods(5, iot.LongDrivingSessionDuration),
	)

	humanLabel := "Flux trucks with longer driving sessions"
	humanDesc := fmt.Sprintf("%s: stopped less than 20 mins in 4 hour period", humanLabel)

	i.fillInQuery(qi, humanLabel, humanDesc, fluxQuery)
}

// TrucksWithLongDailySessions finds all trucks that have driven more than 10 hours in the last 24 hours.
func (i *IoT) TrucksWithLongDailySessions(qi query.Query) {
	fluxQuery := fmt.Sprintf(`
        data
        |> range(start: %s, stop: %s)
        |> filter(fn: (r) => r._measurement == "readings" and r.fleet == "%s")
        |> mean(column: "velocity")
        |> filter(fn: (r) => r._value > 0)
        |> group(columns: ["name", "driver"])
        |> count()
        |> filter(fn: (r) => r._value > %d)
    `,
		i.Interval.Start(),
		i.Interval.End(),
		i.GetRandomFleet(),
		tenMinutePeriods(35, iot.DailyDrivingDuration),
	)

	humanLabel := "Flux trucks with longer daily sessions"
	humanDesc := fmt.Sprintf("%s: drove more than 10 hours in the last 24 hours", humanLabel)

	i.fillInQuery(qi, humanLabel, humanDesc, fluxQuery)
}

// AvgVsProjectedFuelConsumption calculates average and projected fuel consumption per fleet.
func (i *IoT) AvgVsProjectedFuelConsumption(qi query.Query) {
	fluxQuery := fmt.Sprintf(`
        data
        |> range(start: %s, stop: %s)
        |> filter(fn: (r) => r._measurement == "readings" and r.velocity > 1)
        |> group(columns: ["fleet"])
        |> mean(column: "fuel_consumption")
        |> join(
            tables: {predicted: data
                        |> range(start: %s, stop: %s)
                        |> filter(fn: (r) => r._measurement == "predicted_readings")
                        |> group(columns: ["fleet"])
                        |> mean(column: "nominal_fuel_consumption")},
            on: ["fleet"]
        )
    `,
		i.Interval.Start(),
		i.Interval.End(),
		i.Interval.Start(),
		i.Interval.End(),
	)

	humanLabel := "Flux average vs projected fuel consumption per fleet"
	humanDesc := humanLabel

	i.fillInQuery(qi, humanLabel, humanDesc, fluxQuery)
}

// AvgDailyDrivingDuration finds the average driving duration per driver.
func (i *IoT) AvgDailyDrivingDuration(qi query.Query) {
	fluxQuery := fmt.Sprintf(`
        data
        |> range(start: %s, stop: %s)
        |> filter(fn: (r) => r._measurement == "readings" and r.velocity > 1)
        |> group(columns: ["time", "fleet", "name", "driver"])
        |> count(column: "mv")
        |> map(fn: (r) => ({r with _value: r._value / 6}))
        |> group(columns: ["time(1d)", "fleet", "name", "driver"])
    `,
		i.Interval.Start(),
		i.Interval.End(),
	)
	humanLabel := "Flux average driver driving duration per day"
	humanDesc := humanLabel

	i.fillInQuery(qi, humanLabel, humanDesc, fluxQuery)
}

// AvgDailyDrivingSession finds the average driving session without stopping per driver per day.
func (i *IoT) AvgDailyDrivingSession(qi query.Query) {
	fluxQuery := fmt.Sprintf(`
        data
        |> range(start: %s, stop: %s)
        |> filter(fn: (r) => r._measurement == "readings" and r.name != '')
        |> map(fn: (r) => ({r with _value: floor(r._value / 10) / floor(r._value / 10)}))
        |> group(columns: ["time(1d)", "name"])
        |> difference()
        |> elapsed(unit: 1m)
        |> map(fn: (r) => ({r with _value: r.elapsed}))
        |> group(columns: ["time(1d)", "name"])
        |> mean(column: "elapsed")
    `,
		i.Interval.Start(),
		i.Interval.End(),
	)

	humanLabel := "Flux average driver driving session without stopping per day"
	humanDesc := humanLabel

	i.fillInQuery(qi, humanLabel, humanDesc, fluxQuery)
}

// AvgLoad finds the average load per truck model per fleet.
func (i *IoT) AvgLoad(qi query.Query) {
	fluxQuery := fmt.Sprintf(`
        data
        |> range(start: %s, stop: %s)
        |> filter(fn: (r) => r._measurement == "diagnostics")
        |> group(columns: ["fleet", "model"])
        |> mean(column: "current_load" / "load_capacity")
    `,
		i.Interval.Start(),
		i.Interval.End(),
	)

	humanLabel := "Flux average load per truck model per fleet"
	humanDesc := humanLabel

	i.fillInQuery(qi, humanLabel, humanDesc, fluxQuery)
}

// DailyTruckActivity returns the number of hours trucks has been active (not out-of-commission) per day per fleet per model.
func (i *IoT) DailyTruckActivity(qi query.Query) {
	fluxQuery := fmt.Sprintf(`
        data
        |> range(start: %s, stop: %s)
        |> filter(fn: (r) => r._measurement == "diagnostics")
        |> map(fn: (r) => ({r with _value: r.status / r.status}))
        |> group(columns: ["time(1d)", "model", "fleet"])
        |> count(column: "ms")
        |> map(fn: (r) => ({r with _value: r._value / 144}))
    `,
		i.Interval.Start(),
		i.Interval.End(),
	)

	humanLabel := "Flux daily truck activity per fleet per model"
	humanDesc := humanLabel

	i.fillInQuery(qi, humanLabel, humanDesc, fluxQuery)
}

// TruckBreakdownFrequency calculates the amount of times a truck model broke down in the last period.
func (i *IoT) TruckBreakdownFrequency(qi query.Query) {
	startTimeFormatted, endTimeFormatted := formatTimestamps(i.Interval.Start(), i.Interval.End())

	fluxQuery := fmt.Sprintf(`
        data
        |> range(start: %s, stop: %s)
        |> filter(fn: (r) => r._measurement == "diagnostics")
        |> map(fn: (r) => ({r with _value: floor(2 * (sum(r.nzs) / count(r.nzs))) / floor(2 * (sum(r.nzs) / count(r.nzs)))}))
        |> group(columns: ["time(10m)", "model"])
        |> difference()
        |> group(columns: ["model"])
        |> count(column: "state_changed")
        |> filter(fn: (r) => r._value == 1)
    `,
		startTimeFormatted,
		endTimeFormatted,
	)

	humanLabel := "Flux truck breakdown frequency per model"
	humanDesc := humanLabel

	i.fillInQuery(qi, humanLabel, humanDesc, fluxQuery)
}

// tenMinutePeriods calculates the number of 10 minute periods that can fit in
// the time duration if we subtract the minutes specified by minutesPerHour value.
// E.g.: 4 hours - 5 minutes per hour = 3 hours and 40 minutes = 22 ten minute periods
func tenMinutePeriods(minutesPerHour float64, duration time.Duration) int {
	durationMinutes := duration.Minutes()
	leftover := minutesPerHour * duration.Hours()
	return int((durationMinutes - leftover) / 10)
}
