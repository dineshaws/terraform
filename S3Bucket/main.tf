provider "aws" {
    profile = "developer"
    region = "us-east-1"
}

resource "aws_s3_bucket" "mybucket" {
    bucket = "mybucket-dineshaws-1234"
    acl = "private"
    tags = {
        Name = "My Bucket"
        Environment = "dev"
    }
}

resource "aws_s3_bucket_object" "myfirstobject" {
    bucket = "${aws_s3_bucket.mybucket.id}"
    key = "testfile.txt"
    source = "../testfiles/sampleObject.txt"
    etag = "${md5(file("../testfiles/sampleObject.txt"))}"
}