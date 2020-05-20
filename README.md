# Cloud Foundry Shared Redis Release

#### Releases
- cf-routing-release.tgz
- syslog-release.tgz
- bpm-release.tgz
- shared-redis_437.0.12.tgz

```
bosh upload-release http://bosh.io/d/github.com/cloudfoundry-incubator/cf-routing-release
bosh upload-release http://bosh.io/d/github.com/cloudfoundry/syslog-release
bosh upload-release http://bosh.io/d/github.com/cloudfoundry-incubator/bpm-release # required for routing 180+
bosh upload-release --sha1 c401eeb9f3af0a946373331f8fdc69902375e20e \
  https://bosh.io/d/github.com/pivotal-cf/shared-redis-release?v=437.0.12
```

#### Stemcell 
- v315.64
```
bosh upload-stemcell bosh-stemcell-315.64-{laaS}-esxi-ubuntu-xenial-go_agent
```

#### Deployment file
```
  /root/workspace/user/manifest/
   ├── deployment.yml
   ├── deploy-shared-reids.sh
   └── vars.yml
```

#### Testing
- shared-redis deploy (bosh vms -d shared-redis-test)
- catalog check
```
  $ curl http://admin:admin@{URL}:12350/v2/catalog -X GET -H "X-Broker-API-Version: 2.4" -H "Content-Type: application/json"
```

- cf create-service-broker redis-broker
- cf create-service redis-service
-  sample app push : [ https://github.com/pivotal-cf/cf-redis-example-app.git ]
- cf bind service
- sample app restart
- sample app TEST
```
   curl -X PUT redis-example-app.{URL}/foo -d 'data=bar'
   curl -X GET redis-example-app.{URL}/foo
   curl -X DELETE redis-example-app.{URL}/foo
```
- cf unbind-service
- cf delete-service
- cf delete-service-broker

