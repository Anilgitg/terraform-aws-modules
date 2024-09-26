# AWS VPC module implementation using Terraform

Following AWS resources can be created using this module and to achieve High Availability(HA) - using 2 available zones(AZ).

* AWS VPC
* Internet Gateway(IGW) associated with VPC
* 2 Public subnets
* 2 Private subnets
* 2 Database subnets
* Database subnet group for RDS
* Elastic IP(EIP)
* NAT Gateway attached to public subnet
* Public route table
* Private Route Table
* Database Route Table
* Routes
* Route table associations with the subnets
* VPC peering connection with default VPC
* Perring routes in Acceptor and Requestor route tables

# Inputs
* project_name(Mandatory)   - user must provide the project name while implementing their module
* environment(Mandatory)    - user must provide the project name while implementing their module
* vpc_cidr_block(Mandatory) - user must provide the project name while implementing their module
* enable_dns_hostnames(optional) - default is true
* common_tags(optional)     - default value is empty, users can provide tags in map(string) format
* vpc_tags(optional)        - default value is empty, users can provide tags in map(string) format
* igw_tags(optional)        - default value is empty, users can provide tags in map(string) format
* public_subnet_cidrs(Mandatory)    - specify 2 valid subnet CIDRs which are for public
* public_subnet_tags(Optional)      - default value is empty, users can provide tags in map(string) format
* private_subnet_cidrs(Mandatory)   - specify 2 valid subnet CIDRs which are for private
* private_subnet_tags(Optional)     - default value is empty, users can provide tags in map(string) format
* database_subnet_cidrs(Mandatory)  - specify 2 valid subnet CIDRs which are for database
* database_subnet_tags(Optional)    - default value is empty, users can provide tags in map(string) format
* db_subnet_group_tags(Optional)    - default value is empty, users can provide tags in map(string) format
* nat_gateway_tags(Optional)        - default value is empty, users can provide tags in map(string) format
* eip_tags(Optional)                - default value is empty, users can provide tags in map(string) format
* public_route_table_tags(Optional) - default value is empty, users can provide tags in map(string) format
* private_route_table_tags(Optional) - default value is empty, users can provide tags in map(string) format
* is_peering_required(Optional)     - default is false
* vpc_peering_tags(Optional)        - default value is empty, users can provide tags in map(string) format

# Outputs
* vpc_id                - output of VPC id which was created
* public_subnet_ids     - output of public subnet id's created
* private_subnet_ids    - output of private subnet id's created
* database_subnet_ids   - output of database subnet id's created
* az_info               - retrieving the available availability zones in specified AWS region  
* default_vpc_info      - retrieving the default AWS VPC details in specified AWS region for VPC connection peering
* main_route_table_info - retrieving the MAIN route table details in specified AWS region for VPC connection peering