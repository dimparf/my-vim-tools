"adds new keymaps for add and delete nodes
let opts = {'key': 'add', 'quickhelpText': 'add new node', 'callback': 'NERDTreeAddNode'}
call NERDTreeAddKeyMap(opts)
let opts = {'key': 'del', 'quickhelpText': 'delete node', 'callback': 'NERDTreeDeleteNode'}
call NERDTreeAddKeyMap(opts) 
