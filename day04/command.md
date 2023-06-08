# Terraform Commands

Terraform provides several commands to manage the Terraform state, which is used to track the resources Terraform manages. Here are some Terraform state commands:


> terraform state list: Lists all resources and modules in the Terraform state.


> terraform state show: Displays detailed information about a specific resource or module in the Terraform state. You can specify the resource address as an argument.


> terraform state mv: Moves a resource or module to a new address in the Terraform state. This is useful when you want to refactor your configuration or reorganize your resources.


> terraform state rm: Removes a resource or module from the Terraform state. This is useful when you want to remove a resource that is no longer managed by Terraform.


> terraform state pull: Pulls the current state from the configured backend and saves it to a local state file. This can be useful for inspecting the state file outside of Terraform.


> terraform state push: Pushes a local state file to the configured backend. This is useful when you want to restore a state file or share it with collaborators.


> terraform state import: Imports an existing resource into the Terraform state. This is useful when you have resources that were not originally created using Terraform but you want to manage them with Terraform going forward.


> terraform state replace-provider: Replaces the provider for a resource or module in the Terraform state. This is useful when you want to migrate from one provider to another.


> terraform state lock: Locks the Terraform state to prevent concurrent modifications. This is useful when you have multiple users or automation processes interacting with the same state.


> terraform state unlock: Unlocks the Terraform state to allow modifications. This is used to release a lock acquired by terraform state lock.


