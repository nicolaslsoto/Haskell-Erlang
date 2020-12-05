-- $Id: IconifyTests.hs,v 1.1 2013/08/22 19:28:18 leavens Exp $
module IconifyTests where
import Iconify
import WindowLayout
import Testing
main = dotests "IconifyTests $Revision: 1.1 $" tests
tests :: [TestCase WindowLayout]
tests =
    [eqTest (iconify Window {wname="castle", width=1280, height=740})
     "==" (Window {wname="castle", width=2, height=2})
    ,eqTest (iconify (Horizontal [Window {wname="castle", width=1280, height=740},
                                  Window {wname="bball", width=900, height=900}]))
     "==" (Horizontal [Window {wname="castle", width=2, height=2},
                       Window {wname="bball", width=2, height=2}])
    ,eqTest (iconify (Vertical [])) "==" (Vertical [])
    ,eqTest (iconify (Horizontal [])) "==" (Horizontal [])
    ,eqTest (iconify (Vertical [Horizontal [Window {wname="castle", width=1280, height=740},
                                            Window {wname="bball", width=900, height=900}],
                                Vertical [Window {wname="csi", width=1000, height=500}]]))
     "==" (Vertical [Horizontal [Window {wname="castle", width=2, height=2},
                                 Window {wname="bball", width=2, height=2}],
                     Vertical [Window {wname="csi", width=2, height=2}]])
    ,eqTest (iconify (Horizontal [Vertical [Window {wname="csi", width=1280, height=740},
                                            Window {wname="daily", width=900, height=900}],
                                  Horizontal [Window {wname="news", width=1000, height=500},
                                              Horizontal [Window {wname="pbs", width=800,height=400}]]]))
     "==" (Horizontal [Vertical [Window {wname="csi", width=2, height=2},
                                            Window {wname="daily", width=2, height=2}],
                                  Horizontal [Window {wname="news", width=2, height=2},
                                              Horizontal [Window {wname="pbs", width=2,height=2}]]]) ]
