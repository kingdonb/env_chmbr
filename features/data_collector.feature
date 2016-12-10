Feature: Data Collector

@wip
Scenario: Freshly cleared ThingSpeak channel and new database
Given I can read a JSON object from Micro-controller Channel ID: 198792
When I get an empty response from the channel
Then I can see an empty table for datapoints
And I record a null row into the database

@wip
Scenario: When a data point comes
Given I can read a JSON object from Micro-controller Channel ID: 198792
When I get a data point with 5 values from the channel
Then I can see an empty table for datapoints
And I record the data point into the database

@pending
Scenario: When several data points come at once
Given I can read a JSON object from Micro-controller Channel ID: 198792
When I get fifty data points at once
And the data points are not already recorded in the database
Then I record the data points into the database

@pending
Scenario: Data points disappear from ThingSpeak channel after being saved
Given I can read a JSON object from Micro-controller Channel ID: 198792
When I get an empty response from the channel
And I can see data rows in the table for datapoints
Then I record a null row into the database
And the pre-existing data rows in the database are preserved
