### A Pluto.jl notebook ###
# v0.20.24

using Markdown
using InteractiveUtils

# ╔═╡ 1845ca83-60de-4c5c-a34b-69fa24308be9
using Base.Threads

# ╔═╡ 84d2f718-3ffc-11f1-8cb9-dd1b240c127d
md"""
## Конкурентне та паралельне програмування
"""

# ╔═╡ 426b922d-0259-46c5-8045-ac12db7630eb
begin
	a = Ref(0) # a = [0]
	t = @spawn begin 
			sleep(5)
			a[] = 1
			println(a[])
		return a[]
	end
end

# ╔═╡ 05527cd2-2e27-441a-aa50-702a0e0c0513
typeof(t)

# ╔═╡ 1b26e7bb-d596-472a-9775-6e23044b6126
istaskdone(t)

# ╔═╡ dba9d480-05bf-4c83-85a7-491477905380
fetch(t) # wait()

# ╔═╡ 414b0db1-0825-413e-9e93-07ac552262aa
@time begin
	heavycompute(i) = (sleep(1); return i)
	
	b = zeros(100)
	@threads for i = 1:100 	
			b[i] = heavycompute(i)
	end
end

# ╔═╡ 74b28fe9-4720-4051-98d4-3039c6916e51
function test_channels()
	c = Channel(0)
	# c = Channel(5)
	
	@spawn for i=1:2:10
		sleep(0.1)
		put!(c, i)
	end

	@spawn for i=2:2:10
		sleep(1)
		put!(c, i)
	end
	
	begin 
		local s = 0
		while true	
			# sleep(1.1)
			
			@info take!(c)
			s += 1
			
			if s==10 
				close(c)
				break
			end
		end	
	end
end

# ╔═╡ 9b93f55b-6c8d-409d-8b14-317c390411f6
@time test_channels()

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
# ╟─84d2f718-3ffc-11f1-8cb9-dd1b240c127d
# ╠═1845ca83-60de-4c5c-a34b-69fa24308be9
# ╠═426b922d-0259-46c5-8045-ac12db7630eb
# ╠═05527cd2-2e27-441a-aa50-702a0e0c0513
# ╠═1b26e7bb-d596-472a-9775-6e23044b6126
# ╠═dba9d480-05bf-4c83-85a7-491477905380
# ╠═414b0db1-0825-413e-9e93-07ac552262aa
# ╠═74b28fe9-4720-4051-98d4-3039c6916e51
# ╠═9b93f55b-6c8d-409d-8b14-317c390411f6
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
