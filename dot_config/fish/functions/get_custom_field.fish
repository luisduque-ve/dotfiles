function get_custom_field -d "get custom bw field"
  set session_id $argv[1]
  set item_name $argv[2]
  set field_name $argv[3]

  set -l bw_item (env BW_SESSION=$session_id bw get item $item_name)
  set -l field (echo $bw_item | jq -r --arg fieldName "$field_name" '.fields[] | select(.name==$fieldName) | .value')
  echo $field
end
