# diamond-formula

A salt formula that installs and configures [python-diamond](https://github.com/python-diamond), a metrics collection daemon.

-------------
### Contents

##### 1. [IAM Policy](#iam-policy) 

##### 2. [Example Pillar](#example-pillar)

--------------- 
### IAM Policy

	{
	  "Statement": [
	    {
	      "Action": [
	        "cloudwatch:GetMetricStatistics",
	        "cloudwatch:ListMetrics",
	        "cloudwatch:PutMetricData",
	        "ec2:DescribeTags"
	      ],
	      "Effect": "Allow",
	      "Resource": "*"
	    }
	  ]
	}




### Example Pillar

	   diamond:
	      handlers:
	        - diamond.handler.graphite.GraphiteHandler
	          diamond.handler.archive.ArchiveHandler
	    handler:
	      graphite:
	        host: localhost
	        port: 2003
	    collectors:
	      rabbitmq:
	        host: localhost
	         port: 55672
	      elasticsearch:
	        host: localhost
	        port: 9200
	      redis:
	        host: localhost
	        port: 6379
        