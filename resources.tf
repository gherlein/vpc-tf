# Define SSH key pair for our instances
resource "aws_key_pair" "default" {
  key_name = "vpctestkeypair"
  public_key = "${file("${var.key_path}")}"
}

# Define webserver inside the public subnet
resource "aws_instance" "wb" {
   ami  = "${var.ami}"
   instance_type = "t2.nano"
   key_name = "${aws_key_pair.default.id}"
   subnet_id = "${aws_subnet.public-subnet.id}"
   vpc_security_group_ids = ["${aws_security_group.sgweb.id}"]
   associate_public_ip_address = true
   private_ip = "${var.public_subnet_webip}"
   source_dest_check = false
   user_data = "${file("install.sh")}"

  tags {
    Name = "webserver"
  }
}

# Define database inside the private subnet
resource "aws_instance" "db" {
   ami  = "${var.ami}"
   instance_type = "t2.nano"
   key_name = "${aws_key_pair.default.id}"
   subnet_id = "${aws_subnet.private-subnet.id}"
   vpc_security_group_ids = ["${aws_security_group.sgdb.id}"]
   source_dest_check = false

  tags {
    Name = "database"
  }
}

resource "aws_eip" "bar" {
  vpc = true

  instance                  = "${aws_instance.wb.id}"
  associate_with_private_ip = "${var.public_subnet_webip}"
  depends_on                = ["aws_internet_gateway.gw"]
}
