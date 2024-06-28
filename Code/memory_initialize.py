import secrets

random_hex = ""
# Generate 32 random hexadecimal digits
for i in range(512):
    random_hex += secrets.token_hex(4)
    random_hex += '\n'
# Save the generated hex string to a file
with open("my_proj/memory_init.hex", "w") as file:
    file.write(random_hex)

print(f"Generated hex string: {random_hex}")
print("Saved to memory_init.hex")
