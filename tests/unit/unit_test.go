package test

import (
	"os"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

// TestUT_MainTF tests the main.tf file
func TestUT_MainTF(t *testing.T) {
	terraformOptions := &terraform.Options{
		TerraformDir: "../../",
		NoColor:      true,
	}

	defer terraform.Destroy(t, terraformOptions)

	// Run init and validate
	terraform.InitAndValidate(t, terraformOptions)
}

// TestUT_ExampleBasic tests the examples/basic implementation
func TestUT_ExampleBasic(t *testing.T) {
	terraformOptions := &terraform.Options{
		TerraformDir: "../../examples/basic",
		NoColor:      true,
	}

	defer terraform.Destroy(t, terraformOptions)

	// Run init and validate
	terraform.InitAndValidate(t, terraformOptions)
}
