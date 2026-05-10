### A Pluto.jl notebook ###
# v0.20.24

using Markdown
using InteractiveUtils

# ╔═╡ 45adbada-3fbd-11f1-88ac-5dfd4d35f31b
versioninfo()

# ╔═╡ 3fd1c352-6a27-4b14-8c8c-c90290871ab3
md"""
## Базові типи та операції
"""

# ╔═╡ 9854de66-81b9-446f-b833-938a65b9b268
begin
	x = 1; typeof(x)
	# x = 0.1 + 2im; typeof(x)
	# x = "hello"; typeof(x)
	# x = :world; typeof(x)
end

# ╔═╡ 7870793e-0d38-4b7c-ba2e-204f10e07c4f
typeof(x + im)

# ╔═╡ 725a2c70-ab47-43be-9a43-3929207f51c0
eval(:x)

# ╔═╡ 3076e367-ba72-4a31-b872-75d81fbce2c8
y = 1; 2^2y + 3(y+1)y

# ╔═╡ 9de3efc0-d361-4f03-b0cc-091a6d60362b
exp(2pi*im)

# ╔═╡ f446e318-7619-4459-8328-c2eea68cccc5
"hello" * ' ' * string(x)

# ╔═╡ 08987427-50be-4a64-9623-9b65241d18c2
pi == π

# ╔═╡ 997231bf-efbe-41f7-9e03-e4c299c3de9f
α = 1

# ╔═╡ 1ed0a5fc-9792-44ba-a7cc-856a71e24afb
√4

# ╔═╡ 7b9922a2-11bd-4156-a220-10a68545f7ff
δ = 0.0001

# ╔═╡ 0034ddbf-a038-4b9f-8bae-7c3504b80eb6
begin
	b = big(10)^19
	# b += δ
end

# ╔═╡ 0acc630a-f6a6-47d2-8620-87a872e19f8a
md"""
## Масиви
"""

# ╔═╡ 7553d743-28e6-443d-b099-fab78b337bc3
begin
	a = zeros(Float64, 5)
	a = ones(Int32, 3)
	a = Complex[7,8,9,10]
	a = Array{String}(undef, 2, 3)
	a = fill('+', (2, 3))
	a = [1 2 3; 4 5 6]
	a = [i*j for i=1:3, j=1:3]
end

# ╔═╡ 2ca1046c-4898-4ba4-9e00-3230d5e04b26
typeof(1:5)  

# ╔═╡ 32ab5ad0-18fb-40a3-a581-3c2d6c9adde5
collect(1:5)  # range(1,6)

# ╔═╡ e87b2faa-7c82-49df-9054-365e299955fe
a

# ╔═╡ 626e1760-9c34-4004-9366-9d8da185721b
begin
	a[1, 1]
	a[2, end]
	a[1:2, 1:end-1]
	view(a, 1:2, 1:2)
	c = @views a[1:2, 1:end-1]
end

# ╔═╡ 5697a174-97bd-4cf8-9e36-827830bd2e0b
c .+ ones(Int, 2, 2)

# ╔═╡ b5457d04-05cf-4351-a040-e46ec856bff8
exp.(c)

# ╔═╡ 63692999-78cb-43c1-8ffc-ef0d860a4510
a

# ╔═╡ 61593b17-6ced-4e46-942a-ac015d86d876
c .+= ones(Int, 2, 2)

# ╔═╡ f297de8a-57d4-4a88-a803-f0cd8d058108
a

# ╔═╡ 0736a7a3-8378-4966-9059-04e1357ae63b
begin
	d = a[1:2, 1:end-1]
	d .+= ones(Int, 2, 2)
end

# ╔═╡ bc988118-6890-4337-9da3-77d7f43bab13
a

# ╔═╡ 005a1b32-c41b-49d3-bbb9-661dc96ff818
a.^2

# ╔═╡ 4f0bc3fd-6c54-496c-bb3c-b5ff066e529c
map((x,y)->x*y, a, a)

# ╔═╡ d9caa766-c29c-42fd-b870-a08470122be8
size(a)

# ╔═╡ c033128c-66fa-4660-bf46-1cc413a10955
length(a)

# ╔═╡ 8f48340d-1659-4b0b-8d87-f934a06fcab2
reshape(reshape(a, 9), (3,3))

# ╔═╡ 90a854ec-6e2c-4702-be20-67cdfa582b17
vec(a)

# ╔═╡ 024f6a7a-ec2e-493c-ab09-45ef4f96cb0f
vcat(a,a)

# ╔═╡ 559f0f91-0408-42bd-9741-e5689b83a7bc
hcat(a,a)

# ╔═╡ 0a57ae0a-311c-482e-8c2c-f89cf7401459
e = vec(a); push!(e, [7,8,9]...) 

# ╔═╡ ff6a8a7f-7c65-462e-ac45-91bcc54a92ca
push!(e, 7,8,9)

# ╔═╡ 9ec4b849-bf41-4c84-95b2-0a56a832c96b
sort(e)

# ╔═╡ f5883ad5-4577-4fdd-8dff-e867d0b5a316
e

# ╔═╡ 66510f8e-13fd-4ca1-9180-86ec9f05aed4
sort!(e)

# ╔═╡ bb54188a-fe86-49dc-a4ef-d03d69c0c45c
e

# ╔═╡ 538bc18a-fe62-440f-8b30-7c22e07a0bbf
md"""
## Контрольний потік 
"""

# ╔═╡ c2d54cf5-6462-4d85-9084-90c8d4c82458
for s in ["foo","bar","baz"]
    println(s)
end

# ╔═╡ f902b049-0d43-4501-9303-f2354ecf53c0
in == ∈ 

# ╔═╡ 13e93527-7027-44a6-ace3-9460cb4d9471
begin
	s, t = 7, 6
	if s < t
	   println("lesser")
	elseif s > t
	   println("greater")
	else
	   println("equal")
	end
end

# ╔═╡ 2abb2ec3-c1cc-41ad-8a72-36b208b5b330
begin
	i = 0
	while i < 3
		i += 1
		println(i)
	end	
end

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.12.2"
manifest_format = "2.0"
project_hash = "71853c6197a6a7f222db0f1978c7cb232b87c5ee"

[deps]
"""

# ╔═╡ Cell order:
# ╠═45adbada-3fbd-11f1-88ac-5dfd4d35f31b
# ╟─3fd1c352-6a27-4b14-8c8c-c90290871ab3
# ╠═9854de66-81b9-446f-b833-938a65b9b268
# ╠═7870793e-0d38-4b7c-ba2e-204f10e07c4f
# ╠═725a2c70-ab47-43be-9a43-3929207f51c0
# ╠═3076e367-ba72-4a31-b872-75d81fbce2c8
# ╠═9de3efc0-d361-4f03-b0cc-091a6d60362b
# ╠═f446e318-7619-4459-8328-c2eea68cccc5
# ╠═08987427-50be-4a64-9623-9b65241d18c2
# ╠═997231bf-efbe-41f7-9e03-e4c299c3de9f
# ╠═1ed0a5fc-9792-44ba-a7cc-856a71e24afb
# ╠═7b9922a2-11bd-4156-a220-10a68545f7ff
# ╠═0034ddbf-a038-4b9f-8bae-7c3504b80eb6
# ╟─0acc630a-f6a6-47d2-8620-87a872e19f8a
# ╠═7553d743-28e6-443d-b099-fab78b337bc3
# ╠═2ca1046c-4898-4ba4-9e00-3230d5e04b26
# ╠═32ab5ad0-18fb-40a3-a581-3c2d6c9adde5
# ╠═e87b2faa-7c82-49df-9054-365e299955fe
# ╠═626e1760-9c34-4004-9366-9d8da185721b
# ╠═5697a174-97bd-4cf8-9e36-827830bd2e0b
# ╠═b5457d04-05cf-4351-a040-e46ec856bff8
# ╠═63692999-78cb-43c1-8ffc-ef0d860a4510
# ╠═61593b17-6ced-4e46-942a-ac015d86d876
# ╠═f297de8a-57d4-4a88-a803-f0cd8d058108
# ╠═0736a7a3-8378-4966-9059-04e1357ae63b
# ╠═bc988118-6890-4337-9da3-77d7f43bab13
# ╠═005a1b32-c41b-49d3-bbb9-661dc96ff818
# ╠═4f0bc3fd-6c54-496c-bb3c-b5ff066e529c
# ╠═d9caa766-c29c-42fd-b870-a08470122be8
# ╠═c033128c-66fa-4660-bf46-1cc413a10955
# ╠═8f48340d-1659-4b0b-8d87-f934a06fcab2
# ╠═90a854ec-6e2c-4702-be20-67cdfa582b17
# ╠═024f6a7a-ec2e-493c-ab09-45ef4f96cb0f
# ╠═559f0f91-0408-42bd-9741-e5689b83a7bc
# ╠═0a57ae0a-311c-482e-8c2c-f89cf7401459
# ╠═ff6a8a7f-7c65-462e-ac45-91bcc54a92ca
# ╠═9ec4b849-bf41-4c84-95b2-0a56a832c96b
# ╠═f5883ad5-4577-4fdd-8dff-e867d0b5a316
# ╠═66510f8e-13fd-4ca1-9180-86ec9f05aed4
# ╠═bb54188a-fe86-49dc-a4ef-d03d69c0c45c
# ╟─538bc18a-fe62-440f-8b30-7c22e07a0bbf
# ╠═c2d54cf5-6462-4d85-9084-90c8d4c82458
# ╠═f902b049-0d43-4501-9303-f2354ecf53c0
# ╠═13e93527-7027-44a6-ace3-9460cb4d9471
# ╠═2abb2ec3-c1cc-41ad-8a72-36b208b5b330
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
