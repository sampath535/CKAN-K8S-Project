# Introduction


[![Build Status](https://dev.azure.com/dongenergy-p/Orsted%20Data%20Lake/_apis/build/status/odl-ckan-azure?branchName=main)](https://dev.azure.com/dongenergy-p/Orsted%20Data%20Lake/_build/latest?definitionId=7059&branchName=main)

This repository contains the code to create, change, maintain and deploy several CKAN environments on existing AKS clusters for ODE.

## Getting started

Refer to the Orsted Datalake Wiki to get started with this repository [here](https://dev.azure.com/dongenergy-p/Orsted%20Data%20Lake/_wiki/wikis/%C3%98rsted%20Data%20Lake%20Wiki/17968/Containerized-CKAN).

## Directories

* [ci/](.\odl-ckan-azure\ci)
  * [deploy-steps.yml](.\odl-ckan-azure\ci\deploy-steps.yml)
* [docker/](.\odl-ckan-azure\docker)
  * [ckan/](.\odl-ckan-azure\docker\ckan)
    * [**submodule** ckan-customizations/](.\odl-ckan-azure\docker\ckan\ckan-customizations)
    * [ckan-entrypoint.sh](.\odl-ckan-azure\docker\ckan\ckan-entrypoint.sh)
    * [Dockerfile](.\odl-ckan-azure\docker\ckan\Dockerfile)
  * [datapusher/](.\odl-ckan-azure\docker\datapusher)
    * [Dockerfile](.\odl-ckan-azure\docker\datapusher\Dockerfile)
  * [redis/](.\odl-ckan-azure\docker\redis)
    * [Dockerfile](.\odl-ckan-azure\docker\redis\Dockerfile)
  * [solr/](.\odl-ckan-azure\docker\solr)
    * [configsets/](.\odl-ckan-azure\docker\solr\configsets)
      * [currency.xml](.\odl-ckan-azure\docker\solr\configsets\currency.xml)
      * [elevate.xml](.\odl-ckan-azure\docker\solr\configsets\elevate.xml)
      * [protwords.txt](.\odl-ckan-azure\docker\solr\configsets\protwords.txt)
      * [stopwords.txt](.\odl-ckan-azure\docker\solr\configsets\stopwords.txt)
      * [synonyms.txt](.\odl-ckan-azure\docker\solr\configsets\synonyms.txt)
    * [Dockerfile](.\odl-ckan-azure\docker\solr\Dockerfile)
    * [schema.solr8.xml](.\odl-ckan-azure\docker\solr\schema.solr8.xml)
    * [solrconfig.xml](.\odl-ckan-azure\docker\solr\solrconfig.xml)
  * [.env.template](.\odl-ckan-azure\docker\.env.template)
  * [docker-compose.yml](.\odl-ckan-azure\docker\docker-compose.yml)
* [k8s/](.\odl-ckan-azure\k8s)
  * [ckan/](.\odl-ckan-azure\k8s\ckan)
    * [base/](.\odl-ckan-azure\k8s\ckan\base)
      * [configs/](.\odl-ckan-azure\k8s\ckan\base\configs)
      * [.env.template](.\odl-ckan-azure\k8s\ckan\base\.env.template)
      * [ckan.yaml](.\odl-ckan-azure\k8s\ckan\base\ckan.yaml)
      * [kustomization.yaml](.\odl-ckan-azure\k8s\ckan\base\kustomization.yaml)
    * [overlays/](.\odl-ckan-azure\k8s\ckan\overlays)
      * [dev/](.\odl-ckan-azure\k8s\ckan\overlays\dev)
      * [prod/](.\odl-ckan-azure\k8s\ckan\overlays\prod)
      * [test/](.\odl-ckan-azure\k8s\ckan\overlays\test)
  * [datapusher/](.\odl-ckan-azure\k8s\datapusher)
    * [base/](.\odl-ckan-azure\k8s\datapusher\base)
      * [datapusher.yaml](.\odl-ckan-azure\k8s\datapusher\base\datapusher.yaml)
      * [kustomization.yaml](.\odl-ckan-azure\k8s\datapusher\base\kustomization.yaml)
    * [overlays/](.\odl-ckan-azure\k8s\datapusher\overlays)
      * [dev/](.\odl-ckan-azure\k8s\datapusher\overlays\dev)
      * [prod/](.\odl-ckan-azure\k8s\datapusher\overlays\prod)
      * [test/](.\odl-ckan-azure\k8s\datapusher\overlays\test)
  * [redis/](.\odl-ckan-azure\k8s\redis)
    * [base/](.\odl-ckan-azure\k8s\redis\base)
      * [kustomization.yaml](.\odl-ckan-azure\k8s\redis\base\kustomization.yaml)
      * [redis.yaml](.\odl-ckan-azure\k8s\redis\base\redis.yaml)
    * [overlays/](.\odl-ckan-azure\k8s\redis\overlays)
      * [dev/](.\odl-ckan-azure\k8s\redis\overlays\dev)
      * [prod/](.\odl-ckan-azure\k8s\redis\overlays\prod)
      * [test/](.\odl-ckan-azure\k8s\redis\overlays\test)
  * [solr/](.\odl-ckan-azure\k8s\solr)
    * [base/](.\odl-ckan-azure\k8s\solr\base)
      * [kustomization.yaml](.\odl-ckan-azure\k8s\solr\base\kustomization.yaml)
      * [solr.yaml](.\odl-ckan-azure\k8s\solr\base\solr.yaml)
    * [overlays/](.\odl-ckan-azure\k8s\solr\overlays)
      * [dev/](.\odl-ckan-azure\k8s\solr\overlays\dev)
      * [prod/](.\odl-ckan-azure\k8s\solr\overlays\prod)
      * [test/](.\odl-ckan-azure\k8s\solr\overlays\test)
* [script/](.\odl-ckan-azure\script)
  * [installkustomize.sh](.\odl-ckan-azure\script\installkustomize.sh)
* [.gitattributes](.\odl-ckan-azure\.gitattributes)
* [.gitignore](.\odl-ckan-azure\.gitignore)
* [.gitmodules](.\odl-ckan-azure\.gitmodules)
* [azure-pipelines-build-deploy-CKAN.yml](.\odl-ckan-azure\azure-pipelines-build-deploy-CKAN.yml)
* [README.md](.\odl-ckan-azure\README.md)

## k8s
[Kustomize](https://kustomize.io/) has been used to have a base template for the application on Kubernetes with specialization overlays for each environment.

  * `solr`
  * `ckan`
  * `datapusher`
  * `redis`

These are all created as `Deployments`, such that they can be interchanged easily, as CKAN is stateless in nature, due to most data being stored on the accompanying Postgreql databases hosted in Azure.

