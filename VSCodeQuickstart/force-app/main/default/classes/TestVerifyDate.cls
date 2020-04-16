@isTest
private class TestVerifyDate {
    /*Test if date2 > date1 and < than 30 days */
    @isTest static void testDate2IsGreater() {
        Date date1 = Date.today();
        Date date2 = Date.today()+5;
        Date pri = VerifyDate.CheckDates(date1,date2);
        System.assertEquals(date2, pri);
    }

    /*Test if date2 is greater than date1 and greater than 30 days 
    @isTest static void testDate2IsGreater30Days() {
        Date date1 = Date.today();
        Date date2 = Date.today()+50;
        Date pri = VerifyDate.CheckDates(date1,date2);
        System.assertEquals(date2, pri);
    }    */

    /*Test if date2 > date1 < 30 days, So returns the last day of the month*/
    @isTest static void testDate2GreaterLastDayMonth() {
        Date date1 = Date.today();
        Date date2 = Date.today()+50;
		Integer totalDays = Date.daysInMonth(date1.year(), date1.month());
        Date lastDay = Date.newInstance(date1.year(), date1.month(), totalDays);
                
        Date pri = VerifyDate.CheckDates(date1,date2);
        System.assertEquals(lastDay, pri);
    }

    /*Test if date1 is greater than date2
    @isTest static void testDate1IsGreater() {
        Date date1 = Date.today();
        Date date2 = Date.today()+50;
        Date pri = VerifyDate.CheckDates(date1,date2);
        System.assertEquals(date2, pri);
    }    */
}
