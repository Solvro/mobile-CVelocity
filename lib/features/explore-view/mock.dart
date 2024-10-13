import '../profile-preview-view/models/cv.dart';
import '../skills/skill_model.dart';
import '../tags/tag_model.dart';

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
          duration: "10 years",
        ),
      ],
      education: [
        const Education(
          institution: "University degree in Agriculture",
          degree: "Master",
          year: "",
        ),
      ],
      description:
          "GreenHarvest is seeking a passionate and experienced Sustainable Agriculture Specialist to join our team. In this role, you will work closely with farmers, agronomists, and researchers to develop and implement sustainable farming practices.",
      photo:
          "https://theagrotechdaily.com/wp-content/uploads/2022/09/sustainable-agriculture-is-the-best-way-to-feed-the-world-new-research-confirms.jpg",
      isRemote: false,
      searchRange: null,
      createdAt: null,
      updatedAt: null),
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
      description:
          "EcoGrow Solutions is looking for a knowledgeable and committed Regenerative Agriculture Consultant to advise farmers on sustainable practices. The role involves developing strategies that enhance soil health, promote biodiversity, and reduce carbon footprint in farming operations.",
      photo:
          "https://theagrotechdaily.com/wp-content/uploads/2022/09/sustainable-agriculture-is-the-best-way-to-feed-the-world-new-research-confirms.jpg",
      isRemote: true,
      searchRange: 100,
      createdAt: DateTime.parse("2024-01-15T08:00:00Z"),
      updatedAt: DateTime.parse("2024-09-20T10:30:00Z")),
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
      description:
          "EarthRoots Agro is hiring an Agroecology Research Scientist to lead research projects focused on sustainable farming practices and biodiversity enhancement. You will work with multidisciplinary teams to develop innovative solutions that support eco-friendly farming systems.",
      photo:
          "https://theagrotechdaily.com/wp-content/uploads/2022/09/sustainable-agriculture-is-the-best-way-to-feed-the-world-new-research-confirms.jpg",
      isRemote: false,
      searchRange: null,
      createdAt: null,
      updatedAt: null),
  // Additional Mock CV 1
  Cv(
    id: 4,
    title: "Agricultural Sustainability Consultant",
    phoneNumber: "+4455667788",
    fullName: "SustainAg Solutions",
    tags: List<Tag>.from([
      const Tag(tag: "Sustainability"),
      const Tag(tag: "Consulting"),
      const Tag(tag: "Agriculture"),
    ]),
    skills: List<Skill>.from([
      const Skill(skill: "Sustainable Farm Management"),
      const Skill(skill: "Water Conservation"),
      const Skill(skill: "Crop Rotation"),
    ]),
    experience: [
      const Experience(
        company: "AgroSustain",
        position: "Lead Consultant",
        duration: "7 years",
      ),
      const Experience(
        company: "EcoAgritech",
        position: "Agricultural Specialist",
        duration: "4 years",
      ),
    ],
    education: [
      const Education(
        institution: "University of Agricultural Sciences",
        degree: "Bachelor's in Sustainable Agriculture",
        year: "2010",
      ),
    ],
    description:
        "SustainAg Solutions is seeking an Agricultural Sustainability Consultant to help farmers adopt eco-friendly agricultural techniques. The role requires working with farmers to develop sustainable farming strategies while minimizing environmental impact.",
    photo:
        "https://theagrotechdaily.com/wp-content/uploads/2022/09/sustainable-agriculture-is-the-best-way-to-feed-the-world-new-research-confirms.jpg",
    isRemote: true,
    searchRange: 200,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  ),
  // Additional Mock CV 2
  Cv(
    id: 5,
    title: "Organic Farming Specialist",
    phoneNumber: "+6677889900",
    fullName: "OrganicLife Inc.",
    tags: List<Tag>.from([
      const Tag(tag: "Organic Farming"),
      const Tag(tag: "Agriculture"),
    ]),
    skills: List<Skill>.from([
      const Skill(skill: "Compost Management"),
      const Skill(skill: "Pest Control"),
      const Skill(skill: "Sustainable Harvesting"),
    ]),
    experience: [
      const Experience(
        company: "GreenEco Farms",
        position: "Organic Farming Specialist",
        duration: "6 years",
      ),
      const Experience(
        company: "AgriBio Solutions",
        position: "Farm Manager",
        duration: "3 years",
      ),
    ],
    education: [
      const Education(
        institution: "EcoAgriculture Institute",
        degree: "Diploma in Organic Farming",
        year: "2014",
      ),
    ],
    description:
        "OrganicLife Inc. is looking for an experienced Organic Farming Specialist who can help farms transition to organic farming methods. The position involves training farmers in compost management, pest control without chemicals, and sustainable harvesting techniques.",
    photo:
        "https://theagrotechdaily.com/wp-content/uploads/2022/09/sustainable-agriculture-is-the-best-way-to-feed-the-world-new-research-confirms.jpg",
    isRemote: false,
    searchRange: 50,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  ),
];
