# what block height was this tx mined ?
# 49990a9c8e60c8cba979ece134124695ffb270a98ba39c9824e42c4dc227c7eb
TXID="49990a9c8e60c8cba979ece134124695ffb270a98ba39c9824e42c4dc227c7eb"

# 1. Find the block hash where the transaction was mined
BLOCKHASH=$(bitcoin-cli -signet getrawtransaction $TXID 1 | jq -r '.blockhash')

# 2. Get the block details and extract the height
bitcoin-cli -signet getblock $BLOCKHASH | jq -r '.height'
