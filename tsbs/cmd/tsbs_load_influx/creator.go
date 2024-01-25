package main

import (
	"encoding/json"
	"fmt"
	"io/ioutil"
	"log"
	"net/http"
	"net/url"
	"time"
	"strings"
	//"golang.org/x/net/html"
)

type dbCreator struct {
	daemonURL string
}

func (d *dbCreator) Init() {
	d.daemonURL = daemonURLs[0] // pick first one since it always exists
}

func (d *dbCreator) DBExists(dbName string) bool {
	dbs, err := d.listDatabases()
	if err != nil {
		log.Fatal(err)
	}

	for _, db := range dbs {
		if db == loader.DatabaseName() {
			return true
		}
	}
	return false
}

func (d *dbCreator) listDatabases() ([]string, error) {
	fmt.Println("joined listdatabases")
	u := fmt.Sprintf("%sapi/v2/buckets?org=org", d.daemonURL)
	req, err := http.NewRequest("GET", u, nil)
	if err != nil {
		return nil, fmt.Errorf("listDatabases error: %s", err.Error())
	}
	req.Header.Set("Authorization", "Token BbvDs-4dWwspWZpl3FSDKgFmpPDeig7LhasxPiG13-P_XQKb6lx68BrGmR75Hpiobhn70GBH96u1dtb1urKhIQ==")
	//fmt.Println(req)
	client := &http.Client{}
	resp, err := client.Do(req)
	if err != nil {
		return nil, err
	}
	defer resp.Body.Close()

	body, err := ioutil.ReadAll(resp.Body)
	if err != nil {
		return nil, err
	}

	type Link struct {
		Labels  string `json:"labels"`
		Members string `json:"members"`
		Org     string `json:"org"`
		Owners  string `json:"owners"`
		Self    string `json:"self"`
		Write   string `json:"write"`
	}
	
	type RetentionRule struct {
		EverySeconds int    `json:"everySeconds"`
		Type         string `json:"type"`
	}
	
	type Bucket struct {
		CreatedAt       time.Time       `json:"createdAt"`
		Description     string          `json:"description"`
		ID              string          `json:"id"`
		Labels          []string        `json:"labels"`
		Links           Link            `json:"links"`
		Name            string          `json:"name"`
		OrgID           string          `json:"orgID"`
		RetentionRules  []RetentionRule `json:"retentionRules"`
		SchemaType      string          `json:"schemaType"`
		Type            string          `json:"type"`
		UpdatedAt       time.Time       `json:"updatedAt"`
	}
	
	type Links struct {
		Self string `json:"self"`
	}
	
	type listingType struct {
		Buckets []Bucket `json:"buckets"`
		Links   Links    `json:"links"`
	}
	

	var listing listingType
	err = json.Unmarshal(body, &listing)
	if err != nil {
		return nil, err
	}
	ret := []string{}
	fmt.Println(listing)
	for _, nestedName := range listing.Buckets {
		// nestedName is now a single Bucket struct, not a string
		name := nestedName.Name
		id := nestedName.ID
		// the _monitoring and _tasks databases are skipped:
		if name == "_monitoring" || name == "_tasks" {
			continue;
		}
	
		ret = append(ret, id)
	}
	fmt.Println(ret)
	return ret, nil
}

func (d *dbCreator) RemoveOldDB(dbName string) error {
	u := fmt.Sprintf("%sapi/v2/buckets?org=%s&bucket=%s", d.daemonURL, dbName)

	req, err := http.NewRequest("DELETE", u, nil)
	if err != nil {
		return fmt.Errorf("drop bucket error: %s", err.Error())
	}
	
	// Set the Authorization header if needed
	req.Header.Set("Authorization", "Bearer  BbvDs-4dWwspWZpl3FSDKgFmpPDeig7LhasxPiG13-P_XQKb6lx68BrGmR75Hpiobhn70GBH96u1dtb1urKhIQ==")
	
	client := &http.Client{}
	resp, err := client.Do(req)
	if err != nil {
		return fmt.Errorf("drop bucket error: %s", err.Error())
	}
	defer resp.Body.Close()
	
	// Process the response...
	if resp.StatusCode != http.StatusNoContent {
		return fmt.Errorf("drop bucket returned non-204 (No Content) code: %d", resp.StatusCode)
	}
	
	time.Sleep(time.Second)
	return nil
}

func (d *dbCreator) CreateDB(dbName string) error {
	u, err := url.Parse(d.daemonURL)
	if err != nil {
		return err
	}

	// serialize params the right way:
	u.Path = "/api/v2/write"
	v := u.Query()
	v.Set("org", "org") // Replace "org" with your actual organization name
	v.Set("bucket", dbName)
	u.RawQuery = v.Encode()

	data := fmt.Sprintf("db_create_measurement,host=local value=%d", 1)

	req, err := http.NewRequest("POST", u.String(), strings.NewReader(data))
	if err != nil {
		return err
	}

	// Set the Authorization header if needed
	// req.Header.Set("Authorization", "Bearer yourAccessToken")

	client := &http.Client{}
	resp, err := client.Do(req)
	if err != nil {
		return err
	}
	defer resp.Body.Close()

	// Check the response status code
	if resp.StatusCode != http.StatusNoContent {
		return fmt.Errorf("bad db create: %d", resp.StatusCode)
	}

	// Optionally read the response body

	time.Sleep(time.Second)
	return nil
}
