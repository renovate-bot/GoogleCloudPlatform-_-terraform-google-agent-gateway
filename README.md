# Google Network Services Agent Gateway Module

This module deploys a `google_network_services_agent_gateway` resource in a specified GCP project. This gateway is used to integrate with authorization policies and extensions.

## Usage

Here's a basic example of how to use this module:

```terraform
module "my_agent_gateway" {
  source = "./modules/agent_gateway" # Or use a Git/GCS source

  project_id      = "your-gcp-project-id"
  gateway_name    = "my-secure-agent-gateway"
  display_name    = "My Company Agent Gateway"
  # location      = "global" # Defaults to "global"

  # Optional: Associate with pre-existing Authz Policy and Extension
  # authz_policy_id   = "my-authz-policy-id"
  # authz_extension_id = "my-authz-extension-id"

  labels = {
    environment = "dev"
    managed-by  = "terraform"
  }
}

# Example of referencing outputs
output "gateway_id" {
  value = module.my_agent_gateway.agent_gateway_id
}

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| description | A free-text description of the resource. | `string` | `null` | no |
| gateway\_name | The name of the Agent Gateway resource. | `string` | n/a | yes |
| google\_managed\_governed\_access\_path | Operating Mode of Agent Gateway when using Google Managed deployment. Conflicts with self\_managed\_resource\_uri. Possible values: AGENT\_TO\_ANYWHERE, CLIENT\_TO\_AGENT. | `string` | `null` | no |
| labels | A map of key/value labels to apply. | `map(string)` | `{}` | no |
| location | The location of the Agent Gateway | `string` | n/a | yes |
| network\_config\_egress\_network\_attachment | The URI of the Network Attachment resource for egress in network\_config. Format: projects/{project}/regions/{region}/networkAttachments/{name} | `string` | `null` | no |
| project\_id | The GCP project ID where the Agent Gateway will be created. | `string` | n/a | yes |
| protocols | List of protocols (e.g., ['MCP']). | `list(string)` | <pre>[<br>  "MCP"<br>]</pre> | no |
| registries | A list of Agent registries. Format: //agentregistry.googleapis.com/{version}/projects/{project}/locations/{location} | `list(string)` | `[]` | no |
| self\_managed\_resource\_uri | A supported Google Cloud networking proxy URI in the Project and Location when using Self Managed deployment. Conflicts with google\_managed\_governed\_access\_path. | `string` | `null` | no |
| timeout\_create | Timeout for creation. | `string` | `"30m"` | no |
| timeout\_delete | Timeout for deletion. | `string` | `"30m"` | no |
| timeout\_update | Timeout for updates. | `string` | `"30m"` | no |

## Outputs

| Name | Description |
|------|-------------|
| agent\_gateway\_id | The full resource ID of the Agent Gateway. |
| effective\_labels | All labels including those inherited from the provider. |
| mtls\_endpoint | The mTLS Endpoint associated with this Agent Gateway for agent connections. |
| root\_certificates | Root Certificates for Agents to validate this AgentGateway. |
| service\_extensions\_account | Service Account used by Service Extensions to operate. |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
