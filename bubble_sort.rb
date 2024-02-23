def bubble_sort(arr)
    for i in 0..arr.size()
        for j in 0..arr.size() - i
            if arr[j+1] != nil and arr[j] >= arr[j+1]
                arr[j], arr[j+1] = arr[j+1], arr[j]
            end
        end
    end
end

foo = [4,3,78,2,0,2]

bubble_sort(foo)

p foo
