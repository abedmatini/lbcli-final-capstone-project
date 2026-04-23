# Only one tx in block 243,821 signals opt-in RBF. What is its txid?
BLOCKHASH=$(bitcoin-cli -signet getblockhash 243821)

# Get full block data and use jq to find the tx with an RBF sequence number
bitcoin-cli -signet getblock $BLOCKHASH 2 | jq -r '.tx[] | select(any(.vin[]; .sequence < 4294967294)) | .txid'
