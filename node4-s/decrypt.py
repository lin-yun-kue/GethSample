from web3.auto import w3
with open("C:/eth/node1/keystore/UTC--2023-03-13T06-34-34.281287400Z--67f9bf5cdae28c05761e1e8bfd51baf107981f6e") as keyfile:
    encrypt_key = keyfile.read()
    private_key = w3.eth.account.decrypt(encrypt_key, "123456789")

import binascii
print(binascii.b2a_hex(private_key))

