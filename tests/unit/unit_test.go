package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
)

// TestUT_MainTF tests the main.tf file
func TestUT_MainTF(t *testing.T) {
	terraformOptions := &terraform.Options{
		TerraformDir: "../../",
		NoColor:      true,
	}

	// Run init and validate
	terraform.InitAndValidate(t, terraformOptions)
}

// TestUT_ExampleBasic tests the examples/basic implementation
func TestUT_ExampleBasic(t *testing.T) {
	terraformOptions := &terraform.Options{
		TerraformDir: "../../examples/basic",
		NoColor:      true,
	}

	// Run init and validate
	terraform.InitAndValidate(t, terraformOptions)
}
