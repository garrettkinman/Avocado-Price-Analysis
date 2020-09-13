### A Pluto.jl notebook ###
# v0.11.2

using Markdown
using InteractiveUtils

# ╔═╡ 3e1811d0-f513-11ea-2b83-05cd42ff8bf9
md"## Data Analysis
1.  Price vs Volume
2.  Price vs Region
3.  Price vs Month
4.  Price vs Type"

# ╔═╡ f7215a00-f523-11ea-1674-cb60757a26e2
md"Let's first take a look at one region in particular. We'll take the first region, Albany."

# ╔═╡ 0a5d0ebe-f524-11ea-288d-1f7f8a6ea259


# ╔═╡ c94fdee0-f513-11ea-38b6-e95f27de85bb
md"We see that there are two clusters, with very different magnitudes of quantities, which makes it difficult to see what's going on in the left cluster. Let's split the Albany data into two, so we can see each cluster more clearly."

# ╔═╡ 3bc239f0-f51e-11ea-1595-738f5b811660


# ╔═╡ 54a16062-f512-11ea-17ae-f18d96e5ae5d
begin
	using DataFrames
	using CSV
	using Plots
	using Pipe
end

# ╔═╡ 5d506dee-f512-11ea-07eb-e761b322d3be
avocado_prices = CSV.read("avocado.csv")

# ╔═╡ fb57c070-f512-11ea-338e-ef92ca1fa317
rename!(avocado_prices, :"Column1" => :"id", :"4046" => :"Small Hass", :"4225" => :"Large Hass", :"4770" => :"XLarge Hass")

# ╔═╡ 894d26e0-f513-11ea-3ccb-db999354d3b2
grouped_prices = groupby(avocado_prices, :"region")

# ╔═╡ b6d975f0-f513-11ea-14a9-89bcff2918e1
albany_prices = grouped_prices[("Albany",)]

# ╔═╡ 9c37ae60-f513-11ea-3400-e9b0ce82d639
max = @pipe albany_prices[!, :"Total Volume"] |>
            extrema(_)[2] * 1.1 |> 
            round(_) |>
            convert(Int, _)

# ╔═╡ aeb56a50-f513-11ea-3f6c-1d49f3700c58
scatter(albany_prices[!, :"Total Volume"], albany_prices[!, :"AveragePrice"])

# ╔═╡ Cell order:
# ╠═54a16062-f512-11ea-17ae-f18d96e5ae5d
# ╠═5d506dee-f512-11ea-07eb-e761b322d3be
# ╠═fb57c070-f512-11ea-338e-ef92ca1fa317
# ╠═3e1811d0-f513-11ea-2b83-05cd42ff8bf9
# ╠═894d26e0-f513-11ea-3ccb-db999354d3b2
# ╠═f7215a00-f523-11ea-1674-cb60757a26e2
# ╠═0a5d0ebe-f524-11ea-288d-1f7f8a6ea259
# ╠═b6d975f0-f513-11ea-14a9-89bcff2918e1
# ╠═9c37ae60-f513-11ea-3400-e9b0ce82d639
# ╠═aeb56a50-f513-11ea-3f6c-1d49f3700c58
# ╠═c94fdee0-f513-11ea-38b6-e95f27de85bb
# ╠═3bc239f0-f51e-11ea-1595-738f5b811660
