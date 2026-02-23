/**
 * Copyright 2021 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
variable "project_id" {
  description = "The GCP project ID where the Agent Gateway will be created."
  type        = string
}

variable "location" {
  description = "The location of the Agent Gateway"
  type        = string
}

variable "gateway_name" {
  description = "The name of the Agent Gateway resource."
  type        = string
}

variable "labels" {
  description = "A map of key/value labels to apply."
  type        = map(string)
  default     = {}
}

variable "registries" {
  description = "A list of Agent registries. Format: //agentregistry.googleapis.com/{version}/projects/{project}/locations/{location}"
  type        = list(string)
  default     = []
}

variable "description" {
  description = "A free-text description of the resource."
  type        = string
  default     = null
}

variable "google_managed_governed_access_path" {
  description = "Operating Mode of Agent Gateway when using Google Managed deployment. Conflicts with self_managed_resource_uri. Possible values: AGENT_TO_ANYWHERE, CLIENT_TO_AGENT."
  type        = string
  default     = null
}

variable "self_managed_resource_uri" {
  description = "A supported Google Cloud networking proxy URI in the Project and Location when using Self Managed deployment. Conflicts with google_managed_governed_access_path."
  type        = string
  default     = null
}

variable "network_config_egress_network_attachment" {
  description = "The URI of the Network Attachment resource for egress in network_config. Format: projects/{project}/regions/{region}/networkAttachments/{name}"
  type        = string
  default     = null
}

variable "timeout_create" {
  description = "Timeout for creation."
  type        = string
  default     = "30m"
}

variable "timeout_update" {
  description = "Timeout for updates."
  type        = string
  default     = "30m"
}

variable "timeout_delete" {
  description = "Timeout for deletion."
  type        = string
  default     = "30m"
}

variable "protocols" {
  description = "List of protocols (e.g., ['MCP'])."
  type        = list(string)
  default     = ["MCP"]
}