# what is the coinbase tx in this block 243,834
BLOCKHASH=$(bitcoin-cli -signet getblockhash 243834)
bitcoin-cli -signet getblock $BLOCKHASH | jq -r '.tx[0]'
