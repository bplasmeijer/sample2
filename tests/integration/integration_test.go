package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/random"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

// TestIT_ExampleBasic tests the full deployment of the examples/basic implementation
func TestIT_ExampleBasic(t *testing.T) {
	// Skip long-running tests in CI environment
	// To run this test locally, remove the Skip line
	t.Skip("Skipping integration test in CI environment")

	// Generate a random name to avoid conflicts
	uniqueID := random.UniqueId()
	resourceGroupName := "rg-avm-test-" + uniqueID

	terraformOptions := &terraform.Options{
		TerraformDir: "../../examples/basic",
		NoColor:      true,
		Vars: map[string]interface{}{
			"resource_group_name": resourceGroupName,
		},
	}

	// Clean up resources when the test is complete
	defer terraform.Destroy(t, terraformOptions)

	// Run terraform init, plan, and apply
	terraform.InitAndApply(t, terraformOptions)

	// Validate outputs
	resourceId := terraform.Output(t, terraformOptions, "resource_id")
	assert.NotEmpty(t, resourceId)
}
