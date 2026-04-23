# Which tx in block 216,351 spends the coinbase output of block 216,128?
HASH1=$(bitcoin-cli -signet getblockhash 216128)
CB_TXID=$(bitcoin-cli -signet getblock $HASH1 | jq -r '.tx[0]')

HASH2=$(bitcoin-cli -signet getblockhash 216351)
bitcoin-cli -signet getblock $HASH2 2 | jq -r --arg txid "$CB_TXID" '.tx[] | select(.vin[]?.txid == $txid) | .txid'
