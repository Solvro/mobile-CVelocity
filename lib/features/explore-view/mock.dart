import 'package:cvelocity/features/profile-preview-view/models/cv.dart';
import 'package:cvelocity/features/skills/skill_model.dart';
import 'package:cvelocity/features/tags/tag_model.dart';

final companyCVMocks = [
  Cv(
    id: 1,
    title: "Sustainable Agriculture Specialist",
    phoneNumber: "+1234567890",
    fullName: "GreenHarvest",
    tags: List<Tag>.from([
      const Tag(tag: "Agriculture"),
      const Tag(tag: "Sustainability"),
    ]),
    skills: List<Skill>.from([
      const Skill(skill: "Permaculture"),
      const Skill(skill: "Organic Farming"),
      const Skill(skill: "Agroforestry"),
    ]),
    experience: [
      const Experience(
        company: " ",
        position: "Sustainable Agriculture Specialist",
        duration: "10",
      ),
    ], 
    education: [
      const Education(
        institution: "University degree in Agriculture",
        degree: "Master",
        year: "",
      ),
    ], 
    description: "GreenHarvest is seeking a passionate and experienced Sustainable Agriculture Specialist to join our team. In this role, you will work closely with farmers, agronomists, and researchers to develop and implement sustainable farming practices.", 
    photo: "https://theagrotechdaily.com/wp-content/uploads/2022/09/sustainable-agriculture-is-the-best-way-to-feed-the-world-new-research-confirms.jpg", 
    isRemote: false, 
    searchRange: null, 
    createdAt: null,
    updatedAt: null
  ),
  Cv(
    id: 2,
    title: "Regenerative Agriculture Consultant",
    phoneNumber: "+9876543210",
    fullName: "EcoGrow Solutions",
    tags: List<Tag>.from([
      const Tag(tag: "Agriculture"),
      const Tag(tag: "Regeneration"),
      const Tag(tag: "Consulting"),
    ]),
    skills: List<Skill>.from([
      const Skill(skill: "Soil Health Management"),
      const Skill(skill: "Composting"),
      const Skill(skill: "Biodiversity"),
    ]),
    experience: [
      const Experience(
        company: "AgroInnovate",
        position: "Regenerative Agriculture Consultant",
        duration: "8 years",
      ),
      const Experience(
        company: "BioFarm Technologies",
        position: "Sustainable Farming Advisor",
        duration: "5 years",
      ),
    ], 
    education: [
      const Education(
        institution: "Greenfield University",
        degree: "Master's in Environmental Science",
        year: "2015",
      ),
      const Education(
        institution: "EcoTech Academy",
        degree: "Diploma in Soil Science",
        year: "2012",
      ),
    ], 
    description: "EcoGrow Solutions is looking for a knowledgeable and committed Regenerative Agriculture Consultant to advise farmers on sustainable practices. The role involves developing strategies that enhance soil health, promote biodiversity, and reduce carbon footprint in farming operations.",
    photo: "https://theagrotechdaily.com/wp-content/uploads/2022/09/sustainable-agriculture-is-the-best-way-to-feed-the-world-new-research-confirms.jpg",
    isRemote: true, 
    searchRange: 100, 
    createdAt: DateTime.parse("2024-01-15T08:00:00Z"),
    updatedAt: DateTime.parse("2024-09-20T10:30:00Z")
  ),
  Cv(
    id: 3,
    title: "Sustainable Agriculture Specialist",
    phoneNumber: "+1234567890",
    fullName: "GreenHarvest",
    tags: List<Tag>.from([
      const Tag(tag: "Agriculture"),
      const Tag(tag: "Sustainability"),
    ]),
    skills: List<Skill>.from([
      const Skill(skill: "Permaculture"),
      const Skill(skill: "Organic Farming"),
      const Skill(skill: "Agroforestry"),
    ]),
    experience: [
      const Experience(
        company: " ",
        position: "Sustainable Agriculture Specialist",
        duration: "10",
      ),
    ], 
    education: [
      const Education(
        institution: "University degree in Agriculture",
        degree: "Master",
        year: "",
      ),
    ], 
    description: "GreenHarvest is seeking a passionate and experienced Sustainable Agriculture Specialist to join our team. In this role, you will work closely with farmers, agronomists, and researchers to develop and implement sustainable farming practices.", 
    photo: "https://theagrotechdaily.com/wp-content/uploads/2022/09/sustainable-agriculture-is-the-best-way-to-feed-the-world-new-research-confirms.jpg", 
    isRemote: false, 
    searchRange: null, 
    createdAt: null,
    updatedAt: null
  ),
  Cv(
    id: 3,
    title: "Agroecology Research Scientist",
    phoneNumber: "+1122334455",
    fullName: "EarthRoots Agro",
    tags: List<Tag>.from([
      const Tag(tag: "Agroecology"),
      const Tag(tag: "Research"),
      const Tag(tag: "Sustainability"),
    ]),
    skills: List<Skill>.from([
      const Skill(skill: "Agroecological Practices"),
      const Skill(skill: "Field Research"),
      const Skill(skill: "Data Analysis"),
    ]),
    experience: [
      const Experience(
        company: "",
        position: "Agroecology Research Scientist",
        duration: "2 years",
      ),
      const Experience(
        company: "",
        position: "Agricultural Researcher",
        duration: "2 years",
      ),
    ], 
    education: [
      const Education(
        institution: "Global Agricultural University",
        degree: "PhD in Agroecology",
        year: "",
      ),
      const Education(
        institution: "Nature Conservation Academy",
        degree: "Bachelor's in Environmental Science",
        year: "",
      ),
    ], 
    description: "EarthRoots Agro is hiring an Agroecology Research Scientist to lead research projects focused on sustainable farming practices and biodiversity enhancement. You will work with multidisciplinary teams to develop innovative solutions that support eco-friendly farming systems.",
    photo: "https://theagrotechdaily.com/wp-content/uploads/2022/09/sustainable-agriculture-is-the-best-way-to-feed-the-world-new-research-confirms.jpg",
    isRemote: false, 
    searchRange: null, 
    createdAt: null,
    updatedAt: null
  )
];