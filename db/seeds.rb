# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# $uri = 'http://api.football-data.org/v2/competitions/PL/matches/live';
# $reqPrefs['http']['method'] = 'GET';
# $reqPrefs['http']['header'] = 'X-Auth-Token: c0a9283e1baa4db79c422937330dcbaf';
# $stream_context = stream_context_create($reqPrefs);
# $response = file_get_contents($uri, false, $stream_context);
# $matches = json_decode($response)
Match.destroy_all
Team.destroy_all


resp = RestClient::Request.execute(method: :get,
        url: "http://api.football-data.org/v2/competitions/PL/matches?",
        headers:{
            'Content-Type': 'application/json',
            'X-Auth-Token': ENV['API_KEY']
        }) 
        match_data = JSON.parse(resp.body)
        matches = match_data["matches"]
        # byebug

        matches.each do |match|
            Match.create({

                home_team_name:match["homeTeam"]["name"], #string
                home_team_id:match["homeTeam"]["id"], #int

                away_team_name: match["awayTeam"]["name"], #string
                away_team_id: match["awayTeam"]["id"], #int

                match_id: match["id"],
                season_id: match["season"]["id"],
                current_matchday: match["season"]["currentMatchday"],
                status: match["status"],
                matchday:match["matchday"],
                winner: match["score"]["winner"], #string
                
                #liveScore
                home_score: match["score"]["fullTime"]["homeTeam"], #integer
                away_score: match["score"]["fullTime"]["awayTeam"], #integer

                #halftime score
                halftime_home_score: match["score"]["halfTime"]["homeTeam"], #integer
                halftime_away_score: match["score"]["halfTime"]["awayTeam"], #integer

                #overtime score
                overtime_home_score: match["score"]["extraTime"]["homeTeam"], #integer
                overtime_away_score: match["score"]["extraTime"]["awayTeam"], #integer

                #penalties
                penalties_home_score: match["score"]["penalties"]["homeTeam"], #integer
                penalties_away_score: match["score"]["penalties"]["awayTeam"], #integer
            })
            
end

resp = RestClient::Request.execute(method: :get,
    url: "http://api.football-data.org/v2/competitions/PL/teams",
    headers:{
        'Content-Type': 'application/json',
        'X-Auth-Token': 'c0a9283e1baa4db79c422937330dcbaf'
    }) 
    team_data = JSON.parse(resp.body)
    teams = team_data["teams"]

        
        teams.each do |team|
            Team.create({
        
                team_id: team["id"],
                team_name: team["name"],
                crest: team["crestURL"],
                website: team["website"],
                founding_year: team["founded"],
                club_colors: team["clubColors"]
            })
        
end

puts "check out these sweet seeds"