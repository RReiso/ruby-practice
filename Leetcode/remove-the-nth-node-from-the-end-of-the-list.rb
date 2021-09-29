def remove_nth_from_end(head, n)
    node_arr = []
    curr = head
    while curr
        node_arr << curr
        curr = curr.next
    end
    
    delete_idx = node_arr.length - n
    
    if delete_idx == 0
        head = head.next
    else
      node_arr[delete_idx-1].next = node_arr[delete_idx].next
    end
    head
end