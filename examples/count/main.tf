resource "random_pet" "test" {
  count = 2
}

output "module_pet_name_value" {
  value = random_pet.test[*].id
}