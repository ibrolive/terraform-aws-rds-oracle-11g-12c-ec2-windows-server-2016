#!/usr/bin/env groovy
/*
Jenkinsfile for deploying Terraform
*/
    
properties([
    parameters([
        string(name: 'aws_credentials', description: 'AWS Credentials', defaultValue: 'aws-terraform-provisioner', trim: false),
        choice(choices: ['Plan', 'Apply', 'Destroy'], name: 'plan_apply_or_destroy', description: 'Apply or Destroy Terraform')
    ])
])

def podDefinition = """
apiVersion: v1
kind: Pod
spec:
  containers:
  - name: iac-tools
    image: 'add-your-image-here'
    tty: true
    command:
    - 'cat'
"""

podTemplate(yaml: podDefinition)
{
    node(POD_LABEL)
    {
        timestamps
        {
            ansiColor('xterm')
            {
                container("iac-tools")
                {
                    try
                    {
                        withCredentials([ 
                            usernamePassword(credentialsId: params.aws_credentials, usernameVariable: 'username', passwordVariable: 'password'),
                        ])
                        {
                            withEnv(["AWS_ACCESS_KEY_ID=${username}","AWS_SECRET_ACCESS_KEY=${password}","PROJECT=${params.project}"])
                            {
                                lock(resource: 'iac_sandbox_infrastructure_lock')
                                {
                                    deleteDir()

                                    stage('Checkout') {
                                        checkout scm
                                    }

                                    stage('Initialize the Backend') {
                                        sh "make terraform-init"
                                    }

                                    stage('Terraform Plan') {
                                        if (params. plan_apply_or_destroy == 'Destroy') {
                                            sh "make terraform-plan-destroy"
                                        } else {
                                            sh "make terraform-plan" // if plan or apply is selected
                                        }
                                    }

                                    stage('Terraform Apply/Destroy') {
                                        when {
                                            expression {
                                                return params. plan_apply_or_destroy == 'Apply' || params. plan_apply_or_destroy == 'Destroy'
                                            }
                                        }
                                        steps {
                                            script {
                                                if (params. plan_apply_or_destroy == 'Destroy') {
                                                    sh "make terraform-destroy"
                                                } else if (params. plan_apply_or_destroy == 'Apply') {
                                                    sh "make terraform-apply"
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                    catch (err)
                    {
                        throw (err)
                    }
                }
            }
        }
    }
}