provider "aws" {
    region = "us-east-1"
    profile = "developer"
}
// this is single line string example
variable "firststring" {
    type    = "string"
    default = "this is first string variable"
}

output "stringoutput" {
    value = "${var.firststring}"
}

// this is multiline string example
variable "multilinestring" {
    type = "string"
    default = <<EOF
    this is
    multiline
    string
    EOF
}

output "multilinestringoutput" {
    value = "${var.multilinestring}"
}

// this is map example

variable "mapkey" {
    type = "map"
    default = {
        "useast" = "ami-1"
        "uswest" = "ami-2"
    }
}

output "mapoutput" {
    value = "${var.mapkey["uswest"]}"
}

// this is list example

variable "listvariable" {
    type = "list"
    default = ["sg1", "sg2"]
}

output "listoutput" {
    value = "${var.listvariable[0]}"
}

// this is boolean example
variable "testbool" {
    default = "false"
}

output "booloutput" {
    value = "${var.testbool}"
}

variable "myInputVariable" {
    type = "string"
}

output "myOutput" {
    value = "${var.myInputVariable}"
    sensitive = true
}