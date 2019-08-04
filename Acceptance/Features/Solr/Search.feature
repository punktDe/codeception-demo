Feature:
  As a user
  I want to find all accordion contents that matches my permission
  even if they are protected recursively

  Background:
    Given dataset "../../Resources/Private/Fixture/LoginFixture.yaml" is imported
    And records are added to table "sys_domain":
      | pid | domainName        |
      | 1   | [[[DOMAIN_NAME]]] |
    And dataset "Features/Solr/SchedulerFixture.yaml" is imported
    And the database query "UPDATE pages SET deleted=0 where 1=1" is executed
    And the database query "UPDATE pages SET deleted=1 where uid NOT IN (2,3,31,45,615,122,1,6022,6023,6024,143,11,4,141,153,6028,6036,6037,6038,6039,6040,6041,6042)" is executed
    And CLI key "solr" command "updateConnections" is executed
    And I run solr task "Initialize Index Queue Task"
    And I run solr task "Empty Solr Index"
    And I run solr task "Index Queue Worker Task"
    And the core "de_DE" is committed
    And I run solr task "Check Indexing Status"

    Feature: ...
