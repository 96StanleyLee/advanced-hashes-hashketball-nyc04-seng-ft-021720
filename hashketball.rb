require 'pry'

def game_hash
  {
    away: { team_name: 'Charlotte Hornets',
            colors: ['Turquoise','Purple'],
            players: [
              { player_name: 'Jeff Adrien',
                number: 4,
                shoe: 18,
                points: 10,
                rebounds: 1,
                assists: 1,
                steals: 2,
                blocks: 7,
                slam_dunks: 2 },
              { player_name: 'Bismack Biyombo',
                number: 0,
                shoe: 16,
                points: 12,
                rebounds: 4,
                assists: 7,
                steals: 22,
                blocks: 15,
                slam_dunks: 10 },
              { player_name: 'DeSagna Diop',
                number: 2,
                shoe: 14,
                points: 24,
                rebounds: 12,
                assists: 12,
                steals: 4,
                blocks: 5,
                slam_dunks: 5 },
              { player_name: 'Ben Gordon',
                number: 8,
                shoe: 15,
                points: 33,
                rebounds: 3,
                assists: 2,
                steals: 1,
                blocks: 1,
                slam_dunks: 0 },
              { player_name: 'Kemba Walker',
                number: 33,
                shoe: 15,
                points: 6,
                rebounds: 12,
                assists: 12,
                steals: 7,
                blocks: 5,
                slam_dunks: 12 }
            ] },
    home: { team_name: 'Brooklyn Nets',
            colors: ['Black', 'White'],
            players: [
              { player_name: 'Alan Anderson',
                number: 0,
                shoe: 16,
                points: 22,
                rebounds: 12,
                assists: 12,
                steals: 3,
                blocks: 1,
                slam_dunks: 1 },
              { player_name: 'Reggie Evans',
                number: 30,
                shoe: 14,
                points: 12,
                rebounds: 12,
                assists: 12,
                steals: 12,
                blocks: 12,
                slam_dunks: 7 },
              { player_name: 'Brook Lopez',
                number: 11,
                shoe: 17,
                points: 17,
                rebounds: 19,
                assists: 10,
                steals: 3,
                blocks: 1,
                slam_dunks: 15 },
              { player_name: 'Mason Plumlee',
                number: 1,
                shoe: 19,
                points: 26,
                rebounds: 11,
                assists: 6,
                steals: 3,
                blocks: 8,
                slam_dunks: 5 },
              { player_name: 'Jason Terry',
                number: 31,
                shoe: 15,
                points: 19,
                rebounds: 2,
                assists: 2,
                steals: 4,
                blocks: 11,
                slam_dunks: 1 }
            ] }
  }
end


def universal_player_finder(player_name)
  players = game_hash[:home][:players] + game_hash[:away][:players]

    players.find do |player_hash|
    player_hash[:player_name] == player_name
  end
end


def num_points_scored(sought_player_name)
  universal_player_finder(sought_player_name)[:points]
end

def shoe_size(sought_player_name)
  universal_player_finder(sought_player_name)[:shoe]
end

def team_colors(team_name)
  game_hash.each do |place, team|
    return game_hash[place][:colors] if team[:team_name] == team_name
  end
end

def team_names
  game_hash.collect do |_place, team|
    team[:team_name]
  end
end

def team_finder(team_name)
  team = game_hash.values.select do |n|
    n[:team_name] == team_name
  end
end

def player_numbers(team_name)

team = team_finder(team_name)

team[0][:players].map do |n|
  n[:number]
end


end

def player_stats(sought_player_name)
  player = universal_player_finder(sought_player_name)
  player_stats = player
  player_stats.delete(:player_name)
  player_stats
end

def big_shoe_rebounds
  biggest_shoe = 0
  num_rebounds = 0

  game_hash.each do |team, stats|
    stats[:players].each do |players|
      if players[:shoe] > biggest_shoe
        biggest_shoe = players[:shoe]
        num_rebounds = players[:rebounds]
      end
    end
  end

  num_rebounds
end

# # Bonus Questions

# # Since there are multiple bonus questions that ask me
# # to return the name of a player with the most of some stat, I can use the following methods
# # to DRY (don't repeat yourself) up my code.



def player_with_most_of(statistic)
  player_name = ""
  amount_of_stat = 0

  game_hash.each do |team, stats|
    stats[:players].each do |players|
      if players[statistic].is_a? String
        if players[statistic].length > player_name.length
          player_name = players[:player_name]
        end
      elsif players[statistic] > amount_of_stat
        amount_of_stat = players[statistic]
        player_name = players[:player_name]
      end
    end
  end

  player_name
end

def most_points_scored
  player_with_most_of(:points)
end

def winning_team
  # Set up a hash to keep track of the points scored by each team. This way, we
  # can iterate through each player, get their points scored, and increase the
  # count in the hash.
  charlotte = team_finder("Charlotte Hornets")
  nets = team_finder("Brooklyn Nets")

  hornets = charlotte[0][:players].map do |player|
    array = player[:points]
  end

  brooklyn = nets[0][:players].map do |player|
    player[:points]
  end

    if brooklyn.reduce(0) { |total, num| total + num } > hornets.reduce(0) { |total, num| total + num }
        "Brooklyn Nets"
      else
        "Charlotte Hornets"
      end
  end



def player_with_longest_name
  player_with_most_of(:player_name)
end

# # Super Bonus Question

def long_name_steals_a_ton?
  player_with_most_of(:steals) == player_with_most_of(:player_name)
end
