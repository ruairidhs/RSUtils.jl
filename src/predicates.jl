"""
    sequential_compare(f, vec)

Check that `f(vec[i], vec[i-1])` is true for each index of vec.
"""
function sequential_compare(f, vec)
    for i in Iterators.drop(eachindex(vec), 1)
        f(vec[i], vec[i - 1]) || return false
    end
    return true
end

"""
    is_increasing(vec; strict = false)
"""
function is_increasing(vec; strict=false)
    if strict
        return sequential_compare((x1, x0) -> x1 > x0, vec)
    else
        return sequential_compare((x1, x0) -> x1 >= x0, vec)
    end
end
