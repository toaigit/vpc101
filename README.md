This is terraform to build a VPC.  It creates a VPC which includes:   
    Subnets  (each subnet for each Amazon Zone in a Region)   
    Security Group  (FireWall)   
    Internet Gateway (GateWay to outside world)   

You should run this after create a S3 Buckets to store the state files.  
