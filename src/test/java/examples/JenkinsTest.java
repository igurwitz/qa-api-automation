package examples;

import com.intuit.karate.junit5.Karate;

public class JenkinsTest {

    @Karate.Test
    Karate testJenkins()  {
        return Karate.run("jenkins").relativeTo(getClass());
    }
}
