#!/bin/bash
# gcloud auth login

if [[ -z ${GOOGLE_PROJECT_ID} ]]
then 
    echo "Please export your desired project using the variable GOOGLE_PROJECT_ID"
    echo "================================================================"
    echo "run the following command replacing project id with your project" 
    echo          "  export GOOGLE_PROJECT_ID=PROJECT_ID  "
    echo "================================================================"
    
    exit 1
else
    gcloud config set project $GOOGLE_PROJECT_ID   
fi 

echo "Do you want to create a service account now? "
echo "enter yes or no"
read option
if [ $option == "yes" ]
then 
    echo "please enter a service account name"
    read name 
    gcloud iam service-accounts create $name --display-name $name
    ID=$(gcloud iam service-accounts list --filter="email ~ ^$name" --format='value(email)')
    gcloud iam service-accounts keys create key.json --iam-account $ID
elif [ $option == "no" ]
then
    echo "You will need a service account to use terraform. Please create one later"
    exit 1
else 
    echo "please enter yes or no. All lower case"   
fi

echo "if you wish to temporarily grant your terraform service account project owner permissions"
echo "please enter yes, otherwise enter no "
echo "this permission can always be amended"

read option2
if [ $option2 == "yes" ]
then 
    gcloud projects add-iam-policy-binding $GOOGLE_PROJECT_ID --member=serviceAccount:$ID --role=roles/owner
elif [ $option2 == "no" ]
then
    echo "You will need a service account to use terraform. Please create one later"
    exit 1
else 
    echo "please enter yes or no. All lower case"   
fi