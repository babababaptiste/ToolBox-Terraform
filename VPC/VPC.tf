resource "aws_vpc" "this" {
    tags = {
        "Name" = var.vpc-name
        "author" = var.author
        "project" = var.project
    }
}

resource "aws_subnet" "public" {
    vpc_id = aws_vpc.this.id
    availability_zone = "us-west-2"
    tags = {
        "Name" = "Test-public"
        "author" = "bfayty"
    }
}

resource "aws_route_table" "this-rt" {
    vpc_id = aws_vpc.this.id
    tags = {
        "Name" = var.route-table-name
        "author" = var.author
        "project" = var.project
    }
}

resource "aws_route_table_association" "public" {
    subnet_id = aws_subnet.public.id
    route_table_id = aws_route_table.this-rt.id
}


resource "aws_internet_gateway" "this-igw" {
    vpc_id = aws_vpc.this.id
    tags = {
        "Name" = var.igw-name
        "author" = var.author
        "project" = var.project
    }
}

resource "aws_route" "internet-route" {
    destination_cidr_block = "0.0.0.0/0"
    route_table_id = aws_route_table.this-rt.id
    gateway_id = aws_internet_gateway.this-igw.id
}

resource "aws_network_interface" "this-nic" {
    subnet_id = aws_subnet.public.id
    private_ips = [var.private_ip_address]
    security_groups = [aws_security_group.web-pub-sg.id]
    tags = {
        "Name" = var.NI-name
        "author" = var.author
        "project" = var.project
    }
}

resource "aws_eip" "ip-one" {
    vpc = true
    network_interface = aws_network_interface.this-nic.id
    tags = {
        "Name" = var.ipo-name
        "author" = var.author
        "project" = var.project
    }
}