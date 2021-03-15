class User {
  final String name;
  final String age;
  final String emailId;
  final String phoneNo;
  final List<Company> companies;
  final List<Education> educations;
  final String userId;

 const User(this.name, this.age, this.emailId, this.phoneNo, this.companies,this.educations,
      this.userId);
}

class Company{
  final String name;
  final TimePeriod timePeriod;
  final String location;
  final String about;
  final bool isCurrent;
  final List<String> colleaguesIds;

  const Company(this.name, this.timePeriod, this.location, this.about,this.isCurrent,this.colleaguesIds);
}

class TimePeriod{
  final DateTime startTime;
  final DateTime endTime;

  TimePeriod(this.startTime, this.endTime);

}

class Education {
  final String name;
  final TimePeriod timePeriod;
  final String location;
  final String about;
  final bool isCurrent;
  final List<String> educationMatesIds;

  const Education(this.name, this.timePeriod, this.location, this.about,this.isCurrent,this.educationMatesIds);
}

