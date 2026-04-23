# How many satoshis did this transaction pay for fee?: b71fb9ab7707407cc7265591e0c0d47d07afede654f91de1f63c0cb522914bcb
TXID="b71fb9ab7707407cc7265591e0c0d47d07afede654f91de1f63c0cb522914bcb"

# Get the hash of the block that contains this transaction
BLOCKHASH=$(bitcoin-cli -signet getrawtransaction $TXID 1 | jq -r '.blockhash')

# Get the block with verbosity 3 and extract the fee, converting BTC to Satoshis
bitcoin-cli -signet getblock $BLOCKHASH 3 | jq -r --arg txid "$TXID" '.tx[] | select(.txid == $txid) | (.fee * 100000000 | round)'
