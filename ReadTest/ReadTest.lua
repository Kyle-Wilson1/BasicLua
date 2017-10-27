#!/usr/local/bin/lua

--文件输入输出 简单模型
function read_from_file1(filename)
    -- body
    --设置默认输入文件
    io.input(string.format("%s.in",filename))
    --设置默认输出文件
    io.output(string.format("%s.out",filename))
    for line in io.lines() do
        io.write(line,"\n")
    end
    io.flush()--把文件缓存里的操作立即作用到输出文件
    io.close()--关闭文件
end

--文件输入输出 完整模型 能处理二进制文件,如io.open("inpub","b")
function read_from_file2(filename)
    -- body
    local infile=io.open(string.format("%s.in",filename),"r+")
    local str=infile:read("*a")
    infile:close()

    local outfile=io.open(string.format("%s.out",filename),"w+")
    outfile:write(str)
    outfile:flush()
    outfile:close()

end

-- 标准输入，line表示读取一行，number表示读取数字
print("pleate input a string:")
line=io.read("*line")

print("pleate input a number:")
num=io.read("*number")
--标准格式化输出
print(string.format("line=%s,num=%d",line,num))

--调用函数对文件进行输入输出
read_from_file1("a")

read_from_file2("b")
