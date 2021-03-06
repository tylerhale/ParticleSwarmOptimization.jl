function mapParticles(func::Function,sw::Swarm)
  sw.part = map!(func,sw.part)
  return sw
end

function mapSwarms(func::Function,sws::Array{Swarm,1},count::Int64=1)
  if (count < 1)
    return sws
  end
  count -= 1
  mapSwarms(func,map!(func,sws),count)
end

function forSwarm(func::Function,sw::Swarm,count::Int64=1)
  if (count < 1)
    return sw
  end
  count -= 1
  forSwarm(func,func(sw),count)
end

function mapParticlesInSwarms(func::Function,sws::Array{Swarm,1},count=1)
  if (count < 1)
    return sws
  end
  count -= 1
  mapParticlesInSwarms(func,map!(sw -> mapParticles(func,sw),sws),count::Any)
end

function GetBestSolution(sw::Swarm)
  sw.glpt
end

function SwarmGetFitness(sw::Swarm)
  sw.glfi
end
