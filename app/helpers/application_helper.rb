module ApplicationHelper
  
  def auth_token
    "<input
      type=\"hidden\"
      name=\"authenticity_token\"
      value=\"#{form_authenticity_token}\">".html_safe
  end
  
  def records
    RECORDS
  end
  
  def get_events_list(season, gender)
    gender == :women ? women_events(season) : men_events(season)
  end
  
  def women_events(season)
    season == :indoor ? format_indoor_events("Indoor Pentathlon", "") : format_outdoor_events("Heptathlon")
  end
  
  def men_events(season)
    season == :indoor ? format_indoor_events("Indoor Pentathlon", "Heptathlon") : format_outdoor_events("Decathlon")
  end
  
  def format_outdoor_events(multi)
      OUTDOOR_RECORD_EVENTS.map { |event_name| event_name == "MULTI" ? multi : event_name }
  end
  
  def format_indoor_events(multi1, multi2)
      INDOOR_RECORD_EVENTS.map do |event_name|
      if event_name == "MULTI1"
        multi1
      elsif event_name == "MULTI2"
        multi2
      else
        event_name
      end      
    end.reject { |event_name| event_name == "" }
  end  
  
  # I didn't feel the need to create an entire new table for all of this stuff,
  # since for the most part the data never changes
  INDOOR_RECORD_EVENTS = [
    "55m Dash",
    "60m Dash",
    "200m Dash",
    "300m Dash",
    "400m Dash",
    "500m Dash",
    "800m Run",
    "1000m Run",
    "1500m Run",
    "3000m Run",
    "5000m Run",
    "1 Mile Run",
    "55m Hurdles",
    "60m Hurdles",
    "Long Jump",
    "Triple Jump",
    "High Jump",
    "Pole Vault",
    "Weight Throw",
    "Shot Put",
    "MULTI1",
    "MULTI2",
    "4x200m Relay",
    "4x400m Relay",
    "4000m Distance Medley Relay"
  ]
  
  OUTDOOR_RECORD_EVENTS = [
    "100m Dash",
    "200m Dash",
    "400m Dash",
    "800m Run",
    "1500m Run",
    "5000m Run",
    "10000m Run",
    "100m Hurdles",
    "400m Hurdles",
    "3000m Steeplechase",
    "Long Jump",
    "Triple Jump",
    "High Jump",
    "Pole Vault",
    "Shot Put",
    "Discus",
    "Hammer Throw",
    "Javelin",
    "MULTI",
    "4x100m Relay",
    "4x400m Relay"
  ]
  
  # I am not proud of this.
  RECORDS = {
    "55m Dash" => {
      indoor: {
        women: ["7.30", "Cortyney Stackhouse", "2002", ""],
        men: ["6.57", "Edo Bedzra/Solomon Turner", "March 4, 2005/February 6, 2009", ""]
      }
    },
    "60m Dash" => {
      indoor: {
        women: ["8.11", "Margaret Miller", "March 8, 2014", "NCAC Meet"],
        men: ["7.16", "Shawn Chrapczynski", "March 2, 2012", "NCAC Meet"]
      }
    },
    "100m Dash" => {
      outdoor: {
        women: ["11.90", "Kristi Barksdale", "1981", ""],
        men: ["10.84", "George Smith", "1987", ""]
      }
    },
    "200m Dash" => {
      indoor: {
        women: ["25.92", "Nzinga Broussard", "2002", ""],
        men: ["22.51", "Solomon Turner", "March 6, 2009", "NCAC Meet"]
      },
      outdoor: {
        women: ["25.30", "Kristi Barksdale", "1982", ""],
        men: ["21.76", "George Smith", "1987", ""]
      }
    },
    "300m Dash" => {
      indoor: {
        women: ["42.60", "Teresa Collins", "2004", ""],
        men: ["36.06", "Shawn Chrapczynski", "December 9, 2011", ""]
      }
    },
    "400m Dash" => {
      indoor: {
        women: ["58.58", "Marissa Clardy", "March 4, 2011", "NCAC Meet"],
        men: ["50.10", "Ted Lytle", "1996", ""]
      },
      outdoor: {
        women: ["57.66", "Marissa Clardy", "2010", "NCAC Meet"],
        men: ["48.50", "Bret Peterson", "2002", ""]
      }
    },
    "500m Dash" => {
      indoor: {
        women: ["1:19.88", "Marissa Clardy", "February 15, 2013", ""],
        men: ["1:06.56", "Ted Lytle", "1996", ""]
      }
    },
    "800m Run" => {
      indoor: {
        women: ["2:16.35", "Clara Shaw", "March 5, 2010", "NCAC Meet"],
        men: ["1:55.32", "Lynn Seltzer", "1969", ""]
      },
      outdoor: {
        women: ["2:12.75", "Anna Chernin", "May 14, 2008", "NCAA Prov. Qualifier"],
        men: ["1:54.40", "Todd Portune", "1980", ""]
      }
    },
    "1000m Run" => {
      indoor: {
        women: ["3:02.68", "Nicky Ouellet", "2007", ""],
        men: ["2:32.52", "Quinn Hull", "February 18, 2011", ""]
      }
    },
    "1500m Run" => {
      indoor: {
        women: ["4:51.80", "Trista Thornberry", "1997", ""],
        men: ["4:05.49", "Harsha Thirumurthy", "March 4, 1998", ""]
      },
      outdoor: {
        women: ["4:29.74", "Molly Martorella", "May 5, 2012", "NCAC Meet"],
        men: ["3:55.40", "Ryan King", "May 1, 2009", "NCAC Meet"]
      }
    },
    "3000m Run" => {
      indoor: {
        women: ["10:04.56", "Joanna Johnson", "March 4, 2011", "NCAC Meet"],
        men: ["8:35.66", "Geno Arthur", "February 22, 2014", ""]
      }# ,
#       outdoor: {
#         women: ["10:13.00", "Sarah Cox", "1985", ""],
#         men: []
#       }
    },
    "5000m Run" => {
      indoor: {
        women: ["17:02.46", "Joanna Johnson", "March 4, 2011", "NCAA Nationals"],
        men: ["15:12.90", "Ben Schild", "March 5, 2010", "NCAC Meet"]
      },
      outdoor: {
        women: ["16:42.98", "Molly Martorella", "April 26, 2012", ""],
        men: ["14:49.01", "Geno Arthur", "April 12, 2014", ""]
      }
    },
    "10000m Run" => {
      outdoor: {
        women: ["35:11.36", "Molly Martorella", "April 13, 2013", ""],
        men: ["31:53.67", "Everett Schlawin", "May 1, 2009", "NCAC Meet"]
      }
    },
    "1 Mile Run" => {
      indoor: {
        women: ["4:56.73", "Molly Martorella", "February 10, 2012", "BU Valentine Invite"],
        men: ["4:21.75", "Ryan King", "February 29, 2008", "NCAC Meet"]
      }
    },
    "55m Hurdles" => {
      indoor: {
        women: ["8.89", "Carissa Bennet", "March 4, 1995", ""],
        men: ["7.92", "Chris Andrews", "March 1, 1990", ""]
      }
    },
    "60m Hurdles" => {
      indoor: {
        women: ["9.72", "Ava Keating", "March 3, 2012", ""],
        men: ["8.86", "Jerry Choi", "December 9, 2012", ""]
      }
    },
    "100m Hurdles" => {
      outdoor: {
        women: ["13.90", "Kristi Barksdale", "1982", ""],
        men: ["14.67", "Chris Andrews", "1990", ""]
      }
    },
    "400m Hurdles" => {
      outdoor: {
        women: ["1:03.88", "Madeline Schultz", "April 18, 2009", "NCAA Prov. Qualifier"],
        men: ["53.80", "Stanford Carpenter", "1990", ""]
      }
    },
    "3000m Steeplechase" => {
      outdoor: {
        women: ["10:52.52", "Carey Lyons", "April 25, 2014", ""],
        men: ["9:12.31", "Stephen Williams", "May 7, 2011", "NCAC Meet, NCAA Prov. Qualifier"]
      }
    },
    "Long Jump" => {
      indoor: {
        women: ["5.32m", "Apryl Wynn", "2001", ""],
        men: ["7.43m", "Tony Osei", "1978", ""]
      },
      outdoor: {
        women: ["5.43m", "Apryl Wynn", "2001", ""],
        men: ["7.24m", "Sam Barnes", "1936", ""]
      }
    },
    "Triple Jump" => {
      indoor: {
        women: ["11.25m", "Apryl Wynn", "2001", ""],
        men: ["13.96m", "Alex Guo", "March 4, 2013", "NCAC Meet"]
      },
      outdoor: {
        women: ["11.70m", "Apryl Wynn", "2001", ""],
        men: ["14.46m", "Alex Guo", "May 6, 2013", "NCAC Meet"]
      }
    },
    "High Jump" => {
      indoor: {
        women: ["1.65m", "Marcia Uddoh", "1982", ""],
        men: ["1.98m", "Clarence Roland", "1980", ""]
      },
      outdoor: {
        women: ["1.65m", "Marcia Uddoh", "1982", ""],
        men: ["1.98m", "Knudsen/Lund/Leong", "1973/1959/1994", ""]
      }
    },
    "Pole Vault" => {
      indoor: {
        women: ["3.39m", "Laura Vernon", "March 4, 2011", "NCAC Meet"],
        men: ["4.41m", "Shean Perry", "2005", ""]
      },
      outdoor: {
        women: ["3.34m", "Deysi Villarreal", "April 19, 2008", ""],
        men: ["4.70m", "Cory Myers", "May 9, 2008", "NCAC Prov. Qualifier"]
      }
    },
    "Weight Throw" => {
      indoor: {
        women: ["65.15m", "Tiffany Henry", "March 8, 2014", "NCAC Meet, NCAC Record"],
        men: ["14.05m", "Josh Gallagher", "February 18, 2011", ""]
      }
    },
    "Shot Put" => {
      indoor: {
        women: ["12.53m", "Larisa Lewis", "December 7, 2013", ""],
        men: ["15.58m", "John Morton", "1972", ""]
      },
      outdoor: {
        women: ["12.61m", "Larisa Lewis", "May 10, 2013", ""],
        men: ["16.13m", "John Morton", "1971", ""]
      }
    },
    "Discus" => {
      outdoor: {
        women: ["39.19m", "Tiffany Henry", "April 26, 2014", ""],
        men: ["51.53m", "John Morton", "1971", ""]
      }
    },
    "Hammer Throw" => {
      outdoor: {
        women: ["46.31m", "Tiffany Henry", "April 26, 2013", ""],
        men: ["46.76m", "Josh Gallagher", "May 6, 2011", "NCAC Meet"]
      }
    },
    "Javelin" => {
      outdoor: {
        women: ["40.38m", "Emily Enderle", "2003", ""],
        men: ["53.03m", "Alex McKinney", "1986", ""]
      }
    },
    "Indoor Pentathlon" => {
      indoor: {
        women: ["2984", "Madeline Schultz", "February 13, 2009", "Akron Invite"],
        men: ["3105", "Shawn Chrapczynski", "February 27, 2012", "NCAC Meet"]
      }
    },
    "Heptathlon" => {
      indoor: {
        men: ["3989", "Sean Dembowski", "February 25, 2013", "NCAC Meet"]
      },
      outdoor: {
        women: ["4387", "Amie Ely", "2003", ""]
      }
    },
    "Decathlon" => {
      outdoor: {
        men: ["6043", "Kyle Taljan", "April 25, 2009", "NCAC Meet"]
      }
    },
    "4x100m Relay" => {
      outdoor: {
        women: ["48.49", "Broussard, Lane, Chandler, Ely", "2000", ""],
        men: ["42.76", "Simmerman, Austin, Garmon, Smith", "1985", ""]
      }
    },
    "4x200m Relay" => {
      indoor: {
        women: ["1:44.57", "Brancazio, Miller, Parish, Clardy", "March 4, 2013", "NCAC Meet"],
        men: ["1:32.16", "Turner, Shaw, Chrapczynski, Wimberly", "March 6, 2010", "NCAC Meet"]
      }
    },
    "4x400m Relay" => {
      indoor: {
        women: ["4:04.43", "Levine, Miller, Vernon, Clardy", "March 5, 2011", "NCAC Meet"],
        men: ["3:22.77", "Turner, Morris, El-Shair, Wimberly", "March 6, 2009", "NCAC Meet, NCAC Record"]
      },
      outdoor: {
        women: ["3:53.67", "Gelwick, Brancazio, Miller, Clardy", "May 16, 2013", ""],
        men: ["3:17.74", "Turner, Morris, El-Shair, Wimberly", "May 1, 2009", "NCAC Meet"]
      }
    },
    "4000m Distance Medley Relay" => {
      indoor: {
        women: ["12:06.71", "Cerbin, Ouellet, Newberger, Davis-Hayes", "2007", ""],
        men: ["10:30.62", "Moreton, Choi, Taylor, Arthur", "March 8, 2014", "NCAC Meet"]
      }
    }
  }
  
end
