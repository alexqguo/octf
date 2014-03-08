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
  
  def women_indoor_events
    format_indoor_events("Indoor Pentathlon", "")
  end
  
  def men_indoor_events
    format_indoor_events("Indoor Pentathlon", "Heptathlon")
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
  
  RECORDS = {
    "55m Dash" => {
      indoor: {
        women: ["7.30", "Cortyney Stackhouse", "2002", ""],
        men: ["6.57", "Edo Bedzra/Solomon Turner", "March 4, 2005/February 6, 2009", ""]
      },
      outdoor: {
        women: [],
        men: []
      }
    },
    "60m Dash" => {
      indoor: {
        women: ["8.15", "Margaret Miller", "March 3, 2012", ""],
        men: ["7.16", "Shawn Chrapczynski", "March 2, 2012", "NCAC Meet"]
      },
      outdoor: {
        women: [],
        men: []
      }
    },
    "200m Dash" => {
      indoor: {
        women: ["25.92", "Nzinga Broussard", "2002", ""],
        men: ["22.51", "Solomon Turner", "March 6, 2009", "NCAC Meet"]
      },
      outdoor: {
        women: [],
        men: []
      }
    },
    "300m Dash" => {
      indoor: {
        women: ["42.60", "Teresa Collins", "2004", ""],
        men: ["36.06", "Shawn Chrapczynski", "December 9, 2011", ""]
      },
      outdoor: {
        women: [],
        men: []
      }
    },
    "400m Dash" => {
      indoor: {
        women: ["58.58", "Marissa Clardy", "March 4, 2011", "NCAC Meet"],
        men: ["50.10", "Ted Lytle", "1996", ""]
      },
      outdoor: {
        women: [],
        men: []
      }
    },
    "500m Dash" => {
      indoor: {
        women: ["1:19.88", "Marissa Clardy", "February 15, 2013", ""],
        men: ["1:06.56", "Ted Lytle", "1996", ""]
      },
      outdoor: {
        women: [],
        men: []
      }
    },
    "800m Run" => {
      indoor: {
        women: ["2:16.35", "Clara Shaw", "March 5, 2010", "NCAC Meet"],
        men: ["1:55.32", "Lynn Seltzer", "1969", ""]
      },
      outdoor: {
        women: [],
        men: []
      }
    },
    "1000m Run" => {
      indoor: {
        women: ["3:02.68", "Nicky Ouellet", "2007", ""],
        men: ["2:32.52", "Quinn Hull", "February 18, 2011", ""]
      },
      outdoor: {
        women: [],
        men: []
      }
    },
    "1500m Run" => {
      indoor: {
        women: ["4:51.80", "Trista Thornberry", "1997", ""],
        men: ["4:05.49", "Harsha Thirumurthy", "March 4, 1998", ""]
      },
      outdoor: {
        women: [],
        men: []
      }
    },
    "3000m Run" => {
      indoor: {
        women: ["10:04.56", "Joanna Johnson", "March 4, 2011", "NCAC Meet"],
        men: ["8:41.08", "Stephen Williams", "March 4, 2011", "NCAC Meet"]
      },
      outdoor: {
        women: [],
        men: []
      }
    },
    "5000m Run" => {
      indoor: {
        women: ["17:02.46", "Joanna Johnson", "March 4, 2011", "NCAA Nationals"],
        men: ["15:12.90", "Ben Schild", "March 5, 2010", "NCAC Meet"]
      },
      outdoor: {
        women: [],
        men: []
      }
    },
    "1 Mile Run" => {
      indoor: {
        women: ["4:56.73", "Molly Martorella", "February 10, 2012", "BU Valentine Invite"],
        men: ["4:21.75", "Ryan King", "February 29, 2008", "NCAC Meet"]
      },
      outdoor: {
        women: [],
        men: []
      }
    },
    "55m Hurdles" => {
      indoor: {
        women: ["8.89", "Carissa Bennet", "March 4, 1995", ""],
        men: ["7.92", "Chris Andrews", "March 1, 1990", ""]
      },
      outdoor: {
        women: [],
        men: []
      }
    },
    "60m Hurdles" => {
      indoor: {
        women: ["9.72", "Ava Keating", "March 3, 2012", ""],
        men: ["8.86", "Jerry Choi", "December 9, 2012", ""]
      },
      outdoor: {
        women: [],
        men: []
      }
    },
    "Long Jump" => {
      indoor: {
        women: ["5.32m", "Apryl Wynn", "2001", ""],
        men: ["7.43m", "Tony Osei", "1978", ""]
      },
      outdoor: {
        women: [],
        men: []
      }
    },
    "Triple Jump" => {
      indoor: {
        women: ["11.25m", "Apryl Wynn", "2001", ""],
        men: ["13.96m", "Alex Guo", "March 4, 2013", "NCAC Meet"]
      },
      outdoor: {
        women: [],
        men: []
      }
    },
    "High Jump" => {
      indoor: {
        women: ["1.65m", "Marcia Uddoh", "1982", ""],
        men: ["1.98m", "Clarence Roland", "1980", ""]
      },
      outdoor: {
        women: [],
        men: []
      }
    },
    "Pole Vault" => {
      indoor: {
        women: ["3.39m", "Laura Vernon", "March 4, 2011", "NCAC Meet"],
        men: ["4.41m", "Shean Perry", "2005", ""]
      },
      outdoor: {
        women: [],
        men: []
      }
    },
    "Weight Throw" => {
      indoor: {
        women: ["15.15m", "Tiffany Henry", "January 31, 2014", ""],
        men: ["14.05m", "Josh Gallagher", "February 18, 2011", ""]
      },
      outdoor: {
        women: [],
        men: []
      }
    },
    "Shot Put" => {
      indoor: {
        women: ["12.53m", "Larisa Lewis", "December 7, 2013", ""],
        men: ["15.58m", "John Morton", "1972", ""]
      },
      outdoor: {
        women: [],
        men: []
      }
    },
    "Indoor Pentathlon" => {
      indoor: {
        women: ["2984", "Madeline Schultz", "February 13, 2009", "Akron Invite"],
        men: ["3105", "Shawn Chrapczynski", "February 27, 2012", "NCAC Meet"]
      },
      outdoor: {
        women: [],
        men: []
      }
    },
    "Heptathlon" => {
      indoor: {
        women: [],
        men: ["3989", "Sean Dembowski", "February 25, 2013", "NCAC Meet"]
      },
      outdoor: {
        women: [],
        men: []
      }
    },
    "4x200m Relay" => {
      indoor: {
        women: ["1:44.57", "Brancazio, Miller, Parish, Clardy", "March 4, 2013", "NCAC Meet"],
        men: ["1:32.16", "Turner, Shaw, Chrapczynski, Wimberly", "March 6, 2010", "NCAC Meet"]
      },
      outdoor: {
        women: [],
        men: []
      }
    },
    "4x400m Relay" => {
      indoor: {
        women: ["4:04.43", "Levine, Miller, Vernon, Clardy", "March 5, 2011", "NCAC Meet"],
        men: ["3:22.77", "Turner, Morris, El-Shair, Wimberly", "March 6, 2009", "NCAC Meet, NCAC Record"]
      },
      outdoor: {
        women: [],
        men: []
      }
    },
    "4000m Distance Medley Relay" => {
      indoor: {
        women: ["12:06.71", "Cerbin, Ouellet, Newberger, Davis-Hayes", "2007", ""],
        men: ["10:32.50", "Davila, King, Williams, Taljan", "March 6, 2009", "NCAC Meet"]
      },
      outdoor: {
        women: [],
        men: []
      }
    },
  }
  
  
  
end
