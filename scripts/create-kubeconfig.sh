#!/bin/bash

cluster_name=capstonecluster
aws_region=us-west-2

aws eks --region=${aws_region} update-kubeconfig --name=${cluster_name}
