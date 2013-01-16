Simple script to break segments
===============================

oDesk task
    http://www.odesk.com/jobs/Simple-script-break-segments_%7E01be987c4fa23b7e9f?tot=456&pos=1imple script to break segments


Job Description
---------------

I need a command line script to perform the following task (it can be an .sh for Ubuntu terminal or .bat for Windows (preferred))

 Attached file will be the input. I want the output to split each <p></p> segment to words and have the time code updated accordingly.

 Input:
 <p begin="00:00:01.00" end="00:00:03.15">This is a sentence.</p>

 Output:
 <p begin="00:00:01.00" end="00:00:01.53">This</p>
 <p begin="00:00:01.53" end="00:00:02.07">is</p>
 <p begin="00:00:02.07" end="00:00:02.61">a</p>
 <p begin="00:00:02.61" end="00:00:03.15">sentence.</p>

 The input segment start at 01.00 and ends at 03.15 so it is a total of 215 milliseconds. So we break this down for each word in the output, (215/4=53.75) and distribute them to separate segments.

 Milliseconds should be truncated at the second digit.

 I need this ASAP. Please provide a FIX BID in your response message and the soonest time you can deliver the script.



