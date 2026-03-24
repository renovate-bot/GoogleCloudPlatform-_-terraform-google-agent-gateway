// Copyright 2026 Google LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

package simple_example

import (
	"testing"

	"github.com/GoogleCloudPlatform/cloud-foundation-toolkit/infra/blueprint-test/pkg/tft"
	"github.com/stretchr/testify/assert"
)

func TestSimpleExample(t *testing.T) {
	// Initializes the test using the 'examples/simple_example' directory
	bpt := tft.NewTFBlueprintTest(t)

	bpt.DefineVerify(func(assert *assert.Assertions) {
		// DefaultVerify checks that no resources drift after an apply.
		// This proves that Terraform successfully created the resource and the state is stable.
		bpt.DefaultVerify(assert)

		// Get outputs from the Terraform example just to ensure they are populated correctly
		projectID := bpt.GetStringOutput("project_id")
		assert.NotEmpty(projectID, "project_id output should not be empty")

		gatewayID := bpt.GetStringOutput("agent_gateway_id")
		assert.NotEmpty(gatewayID, "agent_gateway_id output should not be empty")

		// We are skipping gcloud verification here because the agent-gateways
		// gcloud command is not yet available in the standard CLI.
	})

	bpt.Test()
}
