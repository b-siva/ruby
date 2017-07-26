#quick sort in place

array = [2,5,1,10,7,21,4,3,8]

def quick(arry, low, hi )
    return arry if arry.length <= 1

    pivot = arry.last
    free = hi
    low = low || 0
    hi = hi-1 || arry.length - 1

    while low <= hi
        if arry[low] <= pivot
            low += 1
        elsif arry[low] > pivot
            arr[free] = arr[low]
            free = low
        elsif arry[hi] > pivot
            arry[hi+1] = arr[hi]
            hi -= 1
        end
    end
end
