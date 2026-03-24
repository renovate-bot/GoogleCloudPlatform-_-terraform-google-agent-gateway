/**
 * Copyright 2026 Google LLC
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

# 1. Override the Google Provider
provider "google" {
  network_security_custom_endpoint    = "https://staging-networksecurity.sandbox.googleapis.com/v1beta1/"
  network_services_custom_endpoint    = "https://staging-networkservices.sandbox.googleapis.com/v1alpha1/"
  certificate_manager_custom_endpoint = "https://staging-certificatemanager.sandbox.googleapis.com/v1/"
}

# 2. Override the Google Beta Provider
provider "google-beta" {
  network_security_custom_endpoint    = "https://staging-networksecurity.sandbox.googleapis.com/v1beta1/"
  network_services_custom_endpoint    = "https://staging-networkservices.sandbox.googleapis.com/v1alpha1/"
  certificate_manager_custom_endpoint = "https://staging-certificatemanager.sandbox.googleapis.com/v1beta1/"
}

module "agent_gateway" {
  source = "../.."

  project_id                          = var.project_id
  location                            = "us-central1"
  gateway_name                        = "simple-agent-gateway-001"
  google_managed_governed_access_path = "AGENT_TO_ANYWHERE"

  labels = {
    environment = "test"
    managed-by  = "terraform"
  }
}
