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
output "agent_gateway_id" {
  description = "The full resource ID of the Agent Gateway."
  value       = google_network_services_agent_gateway.main.id
}

output "mtls_endpoint" {
  description = "The mTLS Endpoint associated with this Agent Gateway for agent connections."
  value       = one(google_network_services_agent_gateway.main.agent_gateway_card[*].mtls_endpoint)
}

output "root_certificates" {
  description = "Root Certificates for Agents to validate this AgentGateway."
  value       = one(google_network_services_agent_gateway.main.agent_gateway_card[*].root_certificates)
}

output "service_extensions_account" {
  description = "Service Account used by Service Extensions to operate."
  value       = one(google_network_services_agent_gateway.main.agent_gateway_card[*].service_extensions_service_account)
}

output "effective_labels" {
  description = "All labels including those inherited from the provider."
  value       = google_network_services_agent_gateway.main.effective_labels
}
