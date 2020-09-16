#!/bin/bash

eksctl create cluster --name=capstonecluster --version=1.17 --nodegroup-name=capstonenodegroup --node-type=t2.medium --nodes=3 --nodes-min=1 --nodes-max=4 --node-ami=auto --region=us-west-2
